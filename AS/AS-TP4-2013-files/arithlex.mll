{
open Helper
open Arithpar
open ArithAST
}

let alphaL = ['a'-'z']
let alphaU = ['A'-'Z']
let alpha = alphaL | alphaU
let digit = ['0'-'9']
let decimal = digit+
let hexa_digit =  ['0'-'9' 'a'-'f' 'A'-'F']
let hexa = '0' ['x' 'X'] hexa_digit+
let id = (alpha | '_')  ('_' | alpha | digit )* 
let float =
  ( digit+  ('.' digit* )? | '.' digit+ )
  ( ['e' 'E'] ['+' '-']? digit+ )?
let escape = '\\' ['r' 'n' 't' 'b' '"' '\'' '\\']
let string = '"' (escape | [^ '\\' '"'])* '"'
  
rule token = parse
| [' ' '\t' '\n']       { token lexbuf }  (* skip blanks *)
| eof                   { EOF }

| "+"                   { PLUS }
| "*"                   { TIMES }
| "-"                   { MINUS }
| "/"                   { DIVIDE }

| "<>"                  { NEQ }
| "=="                  { EQ }
| "<="                  { LEQ }
| ">="                  { GEQ }
| "<"                   { LT }
| ">"                   { GT }
| "&&"                  { AND }
| "||"                  { OR }
| "~"                   { NOT }
| "["                   { OPENCRO }
| "]"                   { CLOSECRO }
| "("                   { OPENPAR }
| ")"                   { CLOSEPAR }
| "{"                   { ACOPEN }
| "}"                   { ACOFER }
| "="                   { ASSIGN }
| ";"                   { PV }
| "++"                  { PP }
| "--"                  { MM }
| "+="                  { PE }
| "-="                  { ME }

| "while"               { WHILE }
| "for"			{ FOR }

|"true"            	{ TRUE }
|"false"        	{ FALSE }
| decimal as i          { INT (ios i) }
| hexa as h             { INT (ios h) }
| float as f            { FLOAT (fos f) }
| string as s           { STRING s }
| id as s               { VAR s }

| "//"                  { comment lexbuf }
| "/*"                  { bcomment 0 lexbuf }
| _ as c                { failwith$spf "arithlex: unrecognised: '%c'" c }


and comment = parse
| '\n' | eof            { token lexbuf }
| _                     { comment lexbuf }

and bcomment n = parse
| "/*"                  { bcomment (succ n) lexbuf }
| "*/"                  { if n > 0 then bcomment (pred n) lexbuf else token lexbuf }
| _                     { bcomment n lexbuf }
