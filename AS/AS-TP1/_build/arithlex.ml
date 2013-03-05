# 1 "arithlex.mll"
 

(** lexer *)
open Toolkit
open Arithpar
open ArithAST

exception Lexer_error



# 14 "arithlex.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\244\255\016\000\075\000\001\000\150\000\162\000\184\000\
    \252\255\253\255\254\255\255\255\225\000\195\000\001\001\024\001\
    \172\000\238\000\058\001\248\255\002\000\048\001\245\255\246\255\
    \003\000\254\255\255\255\213\000\253\255\012\000\002\000\255\255\
    \254\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\011\000\008\000\011\000\011\000\004\000\004\000\
    \255\255\255\255\255\255\255\255\255\255\006\000\255\255\005\000\
    \006\000\255\255\006\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\002\000\002\000\255\255\
    \255\255";
  Lexing.lex_default = 
   "\001\000\000\000\255\255\255\255\020\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\020\000\255\255\000\000\000\000\
    \025\000\000\000\000\000\028\000\000\000\255\255\255\255\000\000\
    \000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\011\000\011\000\000\000\000\000\026\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \011\000\000\000\004\000\019\000\019\000\000\000\000\000\000\000\
    \000\000\000\000\008\000\009\000\031\000\000\000\005\000\002\000\
    \007\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\022\000\032\000\000\000\000\000\000\000\023\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\000\000\000\000\021\000\021\000\003\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\000\000\000\000\
    \000\000\000\000\003\000\000\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \013\000\000\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\013\000\012\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\000\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\012\000\000\000\029\000\
    \010\000\255\255\255\255\026\000\030\000\000\000\000\000\012\000\
    \012\000\000\000\000\000\000\000\017\000\000\000\017\000\000\000\
    \014\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\000\000\000\000\012\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \012\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \014\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\020\000\000\000\000\000\000\000\000\000\020\000\
    \000\000\015\000\015\000\015\000\015\000\015\000\015\000\000\000\
    \000\000\000\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \000\000\000\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\000\000\000\000\000\000\000\000\
    \000\000\015\000\015\000\015\000\015\000\015\000\015\000\012\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\
    \000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\020\000\012\000\
    \000\000\000\000\020\000\000\000\020\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\024\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\004\000\020\000\255\255\255\255\255\255\
    \255\255\255\255\000\000\000\000\030\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\002\000\029\000\255\255\255\255\255\255\002\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\004\000\020\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\255\255\255\255\
    \255\255\255\255\003\000\255\255\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \006\000\255\255\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\007\000\006\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\007\000\255\255\013\000\013\000\013\000\013\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\007\000\255\255\027\000\
    \000\000\004\000\020\000\024\000\027\000\255\255\255\255\006\000\
    \013\000\255\255\255\255\255\255\012\000\255\255\012\000\255\255\
    \007\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\255\255\255\255\007\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \013\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \007\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\014\000\014\000\014\000\014\000\014\000\014\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\021\000\255\255\255\255\255\255\255\255\021\000\
    \255\255\015\000\015\000\015\000\015\000\015\000\015\000\255\255\
    \255\255\255\255\014\000\014\000\014\000\014\000\014\000\014\000\
    \255\255\255\255\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\018\000\255\255\255\255\255\255\255\255\
    \255\255\015\000\015\000\015\000\015\000\015\000\015\000\018\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\021\000\255\255\255\255\255\255\
    \255\255\255\255\021\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\021\000\018\000\
    \255\255\255\255\021\000\255\255\021\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\027\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 28 "arithlex.mll"
                        ( token lexbuf )
# 201 "arithlex.ml"

  | 1 ->
# 29 "arithlex.mll"
                        ( EOF )
# 206 "arithlex.ml"

  | 2 ->
# 31 "arithlex.mll"
                        ( PLUS )
# 211 "arithlex.ml"

  | 3 ->
# 32 "arithlex.mll"
                        ( TIMES )
# 216 "arithlex.ml"

  | 4 ->
let
# 34 "arithlex.mll"
             i
# 222 "arithlex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 34 "arithlex.mll"
                        ( INT (ios i) )
# 226 "arithlex.ml"

  | 5 ->
let
# 35 "arithlex.mll"
          h
# 232 "arithlex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 35 "arithlex.mll"
                        ( INT (ios h) )
# 236 "arithlex.ml"

  | 6 ->
let
# 36 "arithlex.mll"
           f
# 242 "arithlex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 36 "arithlex.mll"
                        ( FLOAT (fos f) )
# 246 "arithlex.ml"

  | 7 ->
let
# 37 "arithlex.mll"
            s
# 252 "arithlex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 37 "arithlex.mll"
                        ( STRING s )
# 256 "arithlex.ml"

  | 8 ->
let
# 38 "arithlex.mll"
        s
# 262 "arithlex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 38 "arithlex.mll"
                        ( VAR s )
# 266 "arithlex.ml"

  | 9 ->
# 40 "arithlex.mll"
                        ( comment lexbuf )
# 271 "arithlex.ml"

  | 10 ->
# 41 "arithlex.mll"
                        ( bcomment 0 lexbuf )
# 276 "arithlex.ml"

  | 11 ->
let
# 42 "arithlex.mll"
       c
# 282 "arithlex.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 42 "arithlex.mll"
                        ( failwith$va "arithlex: unrecognised: '%c'" c )
# 286 "arithlex.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
    __ocaml_lex_comment_rec lexbuf 24
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 46 "arithlex.mll"
                        ( token lexbuf )
# 297 "arithlex.ml"

  | 1 ->
# 47 "arithlex.mll"
                        ( comment lexbuf )
# 302 "arithlex.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

and bcomment n lexbuf =
    __ocaml_lex_bcomment_rec n lexbuf 27
and __ocaml_lex_bcomment_rec n lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 50 "arithlex.mll"
                        ( bcomment (succ n) lexbuf )
# 313 "arithlex.ml"

  | 1 ->
# 51 "arithlex.mll"
                        ( if n > 0 then bcomment (pred n) lexbuf else token lexbuf )
# 318 "arithlex.ml"

  | 2 ->
# 52 "arithlex.mll"
                        ( bcomment n lexbuf )
# 323 "arithlex.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_bcomment_rec n lexbuf __ocaml_lex_state

;;

