exception Error

type token = 
  | VAR of (string)
  | TIMES
  | STRING of (string)
  | PLUS
  | INT of (int)
  | FLOAT of (float)
  | EOF

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState2
  | MenhirState0

  
 
 
(** parser *)

open Toolkit
open ArithAST

let _eRR =
  Error

let rec _menhir_goto_int_plus_right : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 3:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT PLUS int_plus_right \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                               ( Bin (Plus, Int(l), r)) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 5:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 6\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 6:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start -> int_plus_right EOF \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                           ( _1 ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 4:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _1 = _v in
            Printf.fprintf Pervasives.stderr "Accepting\n%!";
            Obj.magic _1
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    Printf.fprintf Pervasives.stderr "Lookahead token is now %s (%d-%d)\n%!" (_menhir_print_token _tok) _menhir_env._menhir_startp.Lexing.pos_cnum _menhir_env._menhir_endp.Lexing.pos_cnum;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 1:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 2\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 2:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 1\n%!";
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2)
    | EOF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT \n%!";
        let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : (ArithAST.t) =         ( Int i ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | FLOAT _ ->
        "FLOAT"
    | INT _ ->
        "INT"
    | PLUS ->
        "PLUS"
    | STRING _ ->
        "STRING"
    | TIMES ->
        "TIMES"
    | VAR _ ->
        "VAR"

and start : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = lexer lexbuf in
    Printf.fprintf Pervasives.stderr "Lookahead token is now %s (%d-%d)\n%!" (_menhir_print_token _tok) lexbuf.Lexing.lex_start_p.Lexing.pos_cnum lexbuf.Lexing.lex_curr_p.Lexing.pos_cnum;
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_startp = lexbuf.Lexing.lex_start_p;
      _menhir_endp = lexbuf.Lexing.lex_curr_p;
      _menhir_shifted = 1073741823;
      } in
    Obj.magic (let _menhir_stack = () in
    Printf.fprintf Pervasives.stderr "State 0:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)



