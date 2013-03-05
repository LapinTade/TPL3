%{
 
 
(** parser *)

open ArithAST

%}

%token EOF
  PLUS TIMES MINUS DIVIDE
  NEQ EQ LEQ GEQ LT GT WHILE FOR DO PE MM ME PP IF ELSE DP PIN 
  AND OR NOT CLOSEPAR OPENPAR OPENCRO CLOSECRO ASSIGN  PV ACOPEN ACOFER
%token<int> INT
%token<float> FLOAT
%token<string> STRING VAR
%token TRUE FALSE 

%left PIN
%left AND OR
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE 
%nonassoc UMINUS /* virtual token */
%nonassoc NOT
(**%nonassoc OPENPAR CLOSEPAR **)


%start <ArithAST.t> start start1

%%
start1: /* test assocs and precedences */
int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF
{ Dummy ("assocs and precs", [$1;$2;$3;$4]) }

start: start2 EOF { $1 } /* YACC-style indexing $1, $2, etc */

start2:
| expr { $1 }
| stmt { $1 }
| terminated_stmt { $1 }

expr:
| i=INT                 { Int i }
| f=FLOAT               { Float f }
| s=STRING              { String s }
| s=VAR                 { Var s }
| l=expr PLUS r=expr    { Bin (Plus, l, r) }
| l=expr TIMES r=expr   { Bin (Times, l, r) }
| l=expr MINUS r=expr   { Bin (Minus, l, r) }
| l=expr DIVIDE r=expr  { Bin (Divide, l, r) }
| e=bin_expr            { e }
| MINUS t=expr          { Un (UMinus,t) }       %prec UMINUS
| NOT   t=expr          { Un (Not,t) }
| id=VAR OPENCRO t=expr CLOSECRO	{ Index (id,t) }
| OPENPAR t=expr CLOSEPAR		{ Parent (t) }
| t=expr PIN e=expr DP r=expr    { Tern(t,e,r)}

stmts_inner:(*epsilon*){ [] } | s=stmt PV ss=stmts_inner { s::ss }

stmts: l=stmts_inner { Stmts l }

bloc:
| ACOPEN s=stmts ACOFER     { s }

terminated_stmt: 
| b=bloc                                    { b }
| s=stmt PV 								{ s }
| i=ifelse	                                { i }
| w=whiles 	                                { w }
| f=fors 	                                { f }
| ACOPEN s=stmts ACOFER							{ s }
(*| DO t=terminated_stmt WHILE b=bin PV 				{ Do(t,b) }*)


ifelse:
| IF e=expr t=terminated_stmt ELSE td=terminated_stmt { IfElse(e,t,td) } 
| IF e=expr t=terminated_stmt { If(e,t) } 

whiles:
| WHILE r=expr t=terminated_stmt { While(r,t) }

fors:
| FOR OPENPAR u=stmt PV e=expr PV u1=stmt CLOSEPAR t1=terminated_stmt { For(u,e,u1,t1) }

dowhile:
| DO t=terminated_stmt WHILE e=expr { Do(t,e) }

assignable:
|v=VAR { Var v }
|id=VAR OPENCRO t=expr CLOSECRO	{ Index (id,t) } 

stmt:
| d=dowhile 			            { d }
| id=assignable ASSIGN	t=expr 		{  Assign (id,t)}
| id=assignable PP	 		{ Assign (id,Bin (Plus, id,Int 1))}
| id=assignable PE	t=expr 	{ Assign (id,Bin (Plus, id, t))}
| id=assignable ME  t=expr 	{ Assign (id,Bin (Minus, id,  t))}
| id=assignable MM		 	{ Assign (id,Bin (Minus, id, Int 1))}


/* %inline is Menhir-specific, though other tools might have equivalent
 * functions. It does what you would expect, and without it you can't
 * factor operators that way, because "expr op expr" has no non-terminal,
 * and therefore is not affected by %left etc. It also yields smaller
 * LR automata (one less state and reduction at runtime).
 *
 * Of course, you could just repeat the "l=expr OP r=expr" pattern ad-nauseam...
 * Exercice: factor the artihmetic operators in the binop rule.
 */
bin: 
|b=bin_expr			{b}
|OPENPAR b=bin_expr CLOSEPAR		{b}


%inline bin_expr: l=expr o=binop r=expr { Bin (o, l, r) }
%inline binop:
| EQ    { Equal } 
| NEQ   { Different }
| LT    { LessThan }
| GT    { GreaterThan }
| LEQ   { LessThanEq }
| GEQ   { GreaterThanEq }
| AND   { And }
| OR    { Or }

/******** assoc *********/

int_plus_left:
| i=INT                       { Int i }
| l=int_plus_left PLUS r=INT  { Bin (Plus, l, Int r) }


int_plus_right:
| i=INT                       { Int i }
| l=INT PLUS r=int_plus_right { Bin (Plus, Int l, r) }

/******** precedence, right assoc *********/

manual_arith_plus_r:
| l=manual_arith_times_r PLUS r=manual_arith_plus_r { Bin (Plus, l,r) }
| manual_arith_times_r                              { $1 }

manual_arith_times_r:
| l=manual_arith_atom TIMES r=manual_arith_times_r  { Bin (Times, l,r) }
| manual_arith_atom                                 { $1 }

manual_arith_atom: INT                              { Int $1 }

/******** precedence, left assoc *********/

manual_arith_plus_l:
| l=manual_arith_plus_l PLUS r=manual_arith_times_l { Bin (Plus, l,r) }
| manual_arith_times_l                              { $1 }

manual_arith_times_l:
| l=manual_arith_times_l TIMES r=manual_arith_atom  { Bin (Times, l,r) }
| manual_arith_atom                                 { $1 }
