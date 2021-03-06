%{
 
 
(** parser *)

open Toolkit
open ArithAST

%}

%token EOF
  PLUS TIMES
%token<int> INT
%token<float> FLOAT
%token<string> STRING VAR

(*%left PLUS
%left TIMES*)

%start <ArithAST.t> start

%%

start: int_plus_right EOF { $1 }


arith:
| i=INT                 { Int i }
| f=FLOAT               { Float f }
| s=STRING              { String s }
| s=VAR                 { Var s }
| l=arith PLUS r=arith  { Bin (Plus, l, r) }
| l=arith TIMES r=arith { Bin (Times, l, r) }

int_plus_left:
| i=INT { Int i }
| l=int_plus_left PLUS r=INT { Bin (Plus, l, Int(r))}

int_plus_right:
| i=INT { Int i }
| l=INT PLUS r=int_plus_right { Bin (Plus, Int(l), r)}