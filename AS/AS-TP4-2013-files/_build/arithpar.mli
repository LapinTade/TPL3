exception Error

type token = 
  | WHILE
  | VAR of (string)
  | TRUE
  | TIMES
  | STRING of (string)
  | PV
  | PP
  | PLUS
  | PIN
  | PE
  | OR
  | OPENPAR
  | OPENCRO
  | NOT
  | NEQ
  | MM
  | MINUS
  | ME
  | LT
  | LEQ
  | INT of (int)
  | IF
  | GT
  | GEQ
  | FOR
  | FLOAT of (float)
  | FALSE
  | EQ
  | EOF
  | ELSE
  | DP
  | DO
  | DIVIDE
  | CLOSEPAR
  | CLOSECRO
  | ASSIGN
  | AND
  | ACOPEN
  | ACOFER


val start1: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t)
val start: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t)