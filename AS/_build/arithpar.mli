exception Error

type token = 
  | VAR of (string)
  | TIMES
  | STRING of (string)
  | PLUS
  | INT of (int)
  | FLOAT of (float)
  | EOF


val start: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t)