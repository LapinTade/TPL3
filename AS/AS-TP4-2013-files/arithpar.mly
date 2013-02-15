%{
 
 
(** parser *)

open ArithAST

%}

%token EOF
  PLUS TIMES MINUS DIVIDE
  NEQ EQ LEQ GEQ LT GT
  AND OR NOT FALSE TRUE
  OPENCRO CLOSECRO
  OPENPAR CLOSEPAR ASSIGN PV
  ACOPEN ACOFER WHILE
  PP MM PE ME FOR
%token<int> INT
%token<float> FLOAT
%token<string> STRING VAR

%left AND OR
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS /* virtual token */
%nonassoc NOT

%start <ArithAST.t> start start1

%%
start1: /* test assocs and precedences */
int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF
{ Dummy ("assocs and precs", [$1;$2;$3;$4]) }

start: start2 EOF { $1 } /* YACC-style indexing $1, $2, etc */

start2:
|stmts {$1}
|assign {$1}
|expr {$1}
|tab {$1}

stmts:
| l=stmts_inner { Stmts l }

stmts_inner:
| { [] }
| s=stmt PV r=stmts_inner { s::r }

stmt:
| a=assign 	{ a }
| b=bloc 	{ b }
| w=whiles 	{ w }
| f=fors 	{ f }

assign:
| a=assignable ASSIGN r=expr { Assign(a,r) }
| a=assignable ASSIGN r=expr { Assign(a,r) }
| v=VAR PP { Assign(Var v,Bin (Plus,Var v, Int 1)) }
| v=VAR MM { Assign(Var v,Bin (Minus,Var v, Int 1)) }
| v=VAR PE r=expr { Assign(Var v,Bin (Plus,Var v, r)) }
| v=VAR ME r=expr { Assign(Var v,Bin (Minus,Var v, r)) }

assignable:
| v=VAR 		{ Var v }
| t=tab			{t}

bloc:
| ACOPEN s=stmts ACOFER {s}

expr:
| t=TRUE		{ True } 
| f=FALSE		{ False }
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
| OPENPAR t=expr CLOSEPAR {t}

tab:
| v=VAR OPENCRO t=expr CLOSECRO { Index(v,t) }

whiles:
| WHILE OPENPAR r=expr CLOSEPAR ACOPEN s=stmts ACOFER { While(r,s) }
| WHILE r=expr ACOPEN s=stmts ACOFER { While(r,s) }
| WHILE r=expr s=stmts { While(r,s) }
| WHILE OPENPAR r=expr CLOSEPAR s=stmts { While(r,s) }

fors:
| FOR OPENPAR a=assign PV e=expr PV s=stmt CLOSEPAR b=bloc { For(a,e,s,b) }
| FOR OPENPAR a=assign PV e=expr PV s=stmt CLOSEPAR s1=stmt { For(a,e,s,s1) }


/* %inline is Menhir-specific, though other tools might have equivalent
 * functions. It does what you would expect, and without it you can't
 * factor operators that way, because "expr op expr" has no non-terminal,
 * and therefore is not affected by %left etc. It also yields smaller
 * LR automata (one less state and reduction at runtime).
 *
 * Of course, you could just repeat the "l=expr OP r=expr" pattern ad-nauseam...
 * Exercice: factor the artihmetic operators in the binop rule.
 */

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
