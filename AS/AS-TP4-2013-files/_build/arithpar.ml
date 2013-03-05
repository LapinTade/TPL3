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

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState123
  | MenhirState120
  | MenhirState118
  | MenhirState116
  | MenhirState113
  | MenhirState110
  | MenhirState108
  | MenhirState104
  | MenhirState100
  | MenhirState93
  | MenhirState92
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState74
  | MenhirState73
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState65
  | MenhirState64
  | MenhirState59
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState50
  | MenhirState49
  | MenhirState47
  | MenhirState46
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState39
  | MenhirState38
  | MenhirState37
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState28
  | MenhirState27
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState21
  | MenhirState20
  | MenhirState19
  | MenhirState17
  | MenhirState16
  | MenhirState15
  | MenhirState13
  | MenhirState12
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState3
  | MenhirState1
  | MenhirState0

  
 
 
(** parser *)

open ArithAST

let _eRR =
  Error

let rec _menhir_goto_manual_arith_plus_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 122:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 126\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 126:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start1 -> int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF \n%!";
        let ((((_menhir_stack, _1), _, _2), _, _3), _, _4) = _menhir_stack in
        let _v : (ArithAST.t) = ( Dummy ("assocs and precs", [_1;_2;_3;_4]) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 103:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = _v in
        Printf.fprintf Pervasives.stderr "Accepting\n%!";
        Obj.magic _1
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 123\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 123:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run120 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 120:\n%!";
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_goto_manual_arith_plus_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 114:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r PLUS manual_arith_plus_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
        _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 118:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ifelse : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 77:\n%!";
    let _menhir_stack = Obj.magic _menhir_stack in
    let i = _v in
    Printf.fprintf Pervasives.stderr "Reducing production terminated_stmt -> ifelse \n%!";
    let _v : (ArithAST.t) =                                            ( i ) in
    _menhir_goto_terminated_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_manual_arith_times_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 119:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 120\n%!";
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_l -> manual_arith_times_l \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_plus_l _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 124:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 120\n%!";
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_l -> manual_arith_plus_l PLUS manual_arith_times_l \n%!";
            let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
            _menhir_goto_manual_arith_plus_l _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_manual_arith_times_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState113 | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 112:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 113\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 113:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113)
        | INT _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 117:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom TIMES manual_arith_times_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run76 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 76:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production terminated_stmt -> stmt PV \n%!";
    let (_menhir_stack, _menhir_s, s) = _menhir_stack in
    let _v : (ArithAST.t) =                     ( s ) in
    _menhir_goto_terminated_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_terminated_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 72:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | WHILE ->
            Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 73\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 73:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | OPENPAR ->
                Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 86:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production fors -> FOR OPENPAR stmt PV expr PV stmt CLOSEPAR terminated_stmt \n%!";
        let ((((((_menhir_stack, _menhir_s), _, u), _, e), _), _, u1), _, t1) = _menhir_stack in
        let _v : (ArithAST.t) =                                                                       ( For(u,e,u1,t1) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 78:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let f = _v in
        Printf.fprintf Pervasives.stderr "Reducing production terminated_stmt -> fors \n%!";
        let _v : (ArithAST.t) =                                           ( f ) in
        _menhir_goto_terminated_stmt _menhir_env _menhir_stack _menhir_s _v
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 87:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            Printf.fprintf Pervasives.stderr "Shifting (ELSE) to state 88\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 88:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | DO ->
                Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | IF ->
                Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88)
        | EOF | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production ifelse -> IF expr terminated_stmt \n%!";
            let (((_menhir_stack, _menhir_s), _, e), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                               ( If(e,t) ) in
            _menhir_goto_ifelse _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 89:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production ifelse -> IF expr terminated_stmt ELSE terminated_stmt \n%!";
        let ((((_menhir_stack, _menhir_s), _, e), _, t), _, td) = _menhir_stack in
        let _v : (ArithAST.t) =                                                       ( IfElse(e,t,td) ) in
        _menhir_goto_ifelse _menhir_env _menhir_stack _menhir_s _v
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 90:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production whiles -> WHILE expr terminated_stmt \n%!";
        let (((_menhir_stack, _menhir_s), _, r), _, t) = _menhir_stack in
        let _v : (ArithAST.t) =                                  ( While(r,t) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 71:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let w = _v in
        Printf.fprintf Pervasives.stderr "Reducing production terminated_stmt -> whiles \n%!";
        let _v : (ArithAST.t) =                                             ( w ) in
        _menhir_goto_terminated_stmt _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 95:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start2 -> terminated_stmt \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                   ( _1 ) in
        _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 111:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = _v in
    Printf.fprintf Pervasives.stderr "Reducing production manual_arith_atom -> INT \n%!";
    let _v : (ArithAST.t) =                                                     ( Int _1 ) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState110 | MenhirState116 | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 115:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 116\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 116:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116)
        | INT _ | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 121:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_times_l TIMES manual_arith_atom \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | MenhirState118 | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 125:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_atom \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( _1 ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_start2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 97:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 98\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 98:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start -> start2 EOF \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                   ( _1 ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 99:\n%!";
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

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState59 | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 58:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 59\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 59:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | DO ->
                Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | ACOFER ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState44 | MenhirState50 | MenhirState88 | MenhirState85 | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 75:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 76\n%!";
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 80:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 81\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 81:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | OPENPAR ->
                Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 84:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CLOSEPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSEPAR) to state 85\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 85:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | DO ->
                Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | IF ->
                Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 96:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 76\n%!";
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start2 -> stmt \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =        ( _1 ) in
            _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce3 : _menhir_env -> (('ttv_tail * _menhir_state * (string)) * _menhir_state * (ArithAST.t)) * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production assignable -> VAR OPENCRO expr CLOSECRO \n%!";
    let (((_menhir_stack, _menhir_s, id), _, t), _) = _menhir_stack in
    let _v : (ArithAST.t) =                                 ( Index (id,t) ) in
    _menhir_goto_assignable _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce24 : _menhir_env -> (('ttv_tail * _menhir_state * (string)) * _menhir_state * (ArithAST.t)) * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR OPENCRO expr CLOSECRO \n%!";
    let (((_menhir_stack, _menhir_s, id), _, t), _) = _menhir_stack in
    let _v : (ArithAST.t) =                                  ( Index (id,t) ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 13:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 15:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 19:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 21:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 23:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 25:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 27:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 29:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 31:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 33:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run35 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 35:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 17:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 39:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_goto_stmts_inner : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 55:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let l = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts -> stmts_inner \n%!";
        let _v : (ArithAST.t) =                      ( Stmts l ) in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 56:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACOFER ->
            Printf.fprintf Pervasives.stderr "Shifting (ACOFER) to state 57\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 57:\n%!";
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production bloc -> ACOPEN stmts ACOFER \n%!";
            let ((_menhir_stack, _menhir_s), _, s) = _menhir_stack in
            let _v : (ArithAST.t) =                             ( s ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 79:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let b = _v in
            Printf.fprintf Pervasives.stderr "Reducing production terminated_stmt -> bloc \n%!";
            let _v : (ArithAST.t) =                                             ( b ) in
            _menhir_goto_terminated_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 60:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let ss = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> stmt PV stmts_inner \n%!";
        let (_menhir_stack, _menhir_s, s) = _menhir_stack in
        let _v : (ArithAST.t list) =                                                          ( s::ss ) in
        _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_int_plus_right : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 109:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT PLUS int_plus_right \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                               ( Bin (Plus, Int l, r) ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 110:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 111\n%!";
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110)
    | _ ->
        _menhir_fail ()

and _menhir_goto_assignable : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 62:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        Printf.fprintf Pervasives.stderr "Shifting (ASSIGN) to state 69\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 69:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
    | ME ->
        Printf.fprintf Pervasives.stderr "Shifting (ME) to state 67\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 67:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MM ->
        Printf.fprintf Pervasives.stderr "Shifting (MM) to state 66\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 66:\n%!";
        let _ = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production stmt -> assignable MM \n%!";
        let (_menhir_stack, _menhir_s, id) = _menhir_stack in
        let _v : (ArithAST.t) =                       ( Assign (id,Bin (Minus, id, Int 1))) in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
    | PE ->
        Printf.fprintf Pervasives.stderr "Shifting (PE) to state 64\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 64:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | PP ->
        Printf.fprintf Pervasives.stderr "Shifting (PP) to state 63\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 63:\n%!";
        let _ = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production stmt -> assignable PP \n%!";
        let (_menhir_stack, _menhir_s, id) = _menhir_stack in
        let _v : (ArithAST.t) =                       ( Assign (id,Bin (Plus, id,Int 1))) in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 10:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> MINUS expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Un (UMinus,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 11:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> NOT expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Un (Not,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 12:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | CLOSEPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSEPAR) to state 41\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState12 in
            Printf.fprintf Pervasives.stderr "State 41:\n%!";
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> OPENPAR expr CLOSEPAR \n%!";
            let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                            ( Parent (t) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 14:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr TIMES expr \n%!";
        let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Bin (Times, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 16:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | MINUS | NEQ | OR | PIN | PLUS | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr PLUS expr \n%!";
            let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                         ( Bin (Plus, l, r) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 18:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr DIVIDE expr \n%!";
        let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Bin (Divide, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 20:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | DP ->
            Printf.fprintf Pervasives.stderr "Shifting (DP) to state 37\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState20 in
            Printf.fprintf Pervasives.stderr "State 37:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | OPENPAR ->
                Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 22:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | FOR | IF | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr OR expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( Or )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 24:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | IF | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr NEQ expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( Different )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 26:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | MINUS | NEQ | OR | PIN | PLUS | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr MINUS expr \n%!";
            let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                         ( Bin (Minus, l, r) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 28:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr LT expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( LessThan )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 30:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr LEQ expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( LessThanEq )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 32:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr GT expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( GreaterThan )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 34:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr GEQ expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( GreaterThanEq )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 36:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | EQ | FOR | IF | NEQ | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr EQ expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( Equal )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 38:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | ACOPEN | CLOSECRO | CLOSEPAR | DO | DP | EOF | FOR | IF | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr PIN expr DP expr \n%!";
            let (((((_menhir_stack, _menhir_s, t), _), _, e), _), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                                  ( Tern(t,e,r)) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 40:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | DO | DP | EOF | FOR | IF | OR | PIN | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr AND expr \n%!";
            let (((_menhir_stack, _menhir_s, l0), _), _, r0) = _menhir_stack in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let l = l0 in
              let o =
                        ( And )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 42:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | CLOSECRO ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSECRO) to state 43\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState42 in
            Printf.fprintf Pervasives.stderr "State 43:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _ = _menhir_discard _menhir_env in
            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 44:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACOPEN ->
            Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | DO ->
            Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | FOR ->
            Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | IF ->
            Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | WHILE ->
            Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 47:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CLOSECRO ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSECRO) to state 48\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState47 in
            Printf.fprintf Pervasives.stderr "State 48:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _ = _menhir_discard _menhir_env in
            _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 50:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACOPEN ->
            Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | DO ->
            Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | FOR ->
            Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | IF ->
            Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | WHILE ->
            Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 65:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production stmt -> assignable PE expr \n%!";
            let ((_menhir_stack, _menhir_s, id), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                            ( Assign (id,Bin (Plus, id, t))) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 68:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production stmt -> assignable ME expr \n%!";
            let ((_menhir_stack, _menhir_s, id), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                             ( Assign (id,Bin (Minus, id,  t))) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 70:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production stmt -> assignable ASSIGN expr \n%!";
            let ((_menhir_stack, _menhir_s, id), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                                 (  Assign (id,t)) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 74:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production dowhile -> DO terminated_stmt WHILE expr \n%!";
            let (((_menhir_stack, _menhir_s), _, t), _, e) = _menhir_stack in
            let _v : (ArithAST.t) =                                     ( Do(t,e) ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 61:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let d = _v in
            Printf.fprintf Pervasives.stderr "Reducing production stmt -> dowhile \n%!";
            let _v : (ArithAST.t) =                            ( d ) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 82:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 83\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState82 in
            Printf.fprintf Pervasives.stderr "State 83:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | DO ->
                Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 93:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | CLOSECRO ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSECRO) to state 94\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState93 in
            Printf.fprintf Pervasives.stderr "State 94:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | AND | DIVIDE | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PIN | PLUS | TIMES ->
                _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
            | ASSIGN | ME | MM | PE | PP ->
                _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 100:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 39\n%!";
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | PIN ->
            Printf.fprintf Pervasives.stderr "Shifting (PIN) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start2 -> expr \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =        ( _1 ) in
            _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
    | _ ->
        _menhir_fail ()

and _menhir_reduce55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> \n%!";
    let _v : (ArithAST.t list) =                        ( [] ) in
    _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 45:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | OPENCRO ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENCRO) to state 46\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 46:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
    | ASSIGN | ME | MM | PE | PP ->
        _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 107:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 108\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 108:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 107\n%!";
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108)
    | INT _ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT \n%!";
        let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : (ArithAST.t) =                               ( Int i ) in
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
    | ACOFER ->
        "ACOFER"
    | ACOPEN ->
        "ACOPEN"
    | AND ->
        "AND"
    | ASSIGN ->
        "ASSIGN"
    | CLOSECRO ->
        "CLOSECRO"
    | CLOSEPAR ->
        "CLOSEPAR"
    | DIVIDE ->
        "DIVIDE"
    | DO ->
        "DO"
    | DP ->
        "DP"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | FALSE ->
        "FALSE"
    | FLOAT _ ->
        "FLOAT"
    | FOR ->
        "FOR"
    | GEQ ->
        "GEQ"
    | GT ->
        "GT"
    | IF ->
        "IF"
    | INT _ ->
        "INT"
    | LEQ ->
        "LEQ"
    | LT ->
        "LT"
    | ME ->
        "ME"
    | MINUS ->
        "MINUS"
    | MM ->
        "MM"
    | NEQ ->
        "NEQ"
    | NOT ->
        "NOT"
    | OPENCRO ->
        "OPENCRO"
    | OPENPAR ->
        "OPENPAR"
    | OR ->
        "OR"
    | PE ->
        "PE"
    | PIN ->
        "PIN"
    | PLUS ->
        "PLUS"
    | PP ->
        "PP"
    | PV ->
        "PV"
    | STRING _ ->
        "STRING"
    | TIMES ->
        "TIMES"
    | TRUE ->
        "TRUE"
    | VAR _ ->
        "VAR"
    | WHILE ->
        "WHILE"

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 1:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_reduce2 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production assignable -> VAR \n%!";
    let (_menhir_stack, _menhir_s, v) = _menhir_stack in
    let _v : (ArithAST.t) =        ( Var v ) in
    _menhir_goto_assignable _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce9 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR \n%!";
    let (_menhir_stack, _menhir_s, s) = _menhir_stack in
    let _v : (ArithAST.t) =                         ( Var s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 2:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | OPENCRO ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENCRO) to state 3\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 3:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
    | ACOPEN | AND | CLOSECRO | CLOSEPAR | DIVIDE | DO | DP | EOF | EQ | FOR | GEQ | GT | IF | LEQ | LT | MINUS | NEQ | OR | PIN | PLUS | PV | TIMES | VAR _ | WHILE ->
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 4:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let s = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> STRING \n%!";
    let _v : (ArithAST.t) =                         ( String s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 5:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 6:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 7:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 8:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let i = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> INT \n%!";
    let _v : (ArithAST.t) =                         ( Int i ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 49:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 51:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 52\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 52:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | DO ->
            Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (float) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 9:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let f = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FLOAT \n%!";
    let _v : (ArithAST.t) =                         ( Float f ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 53:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | ACOPEN ->
        Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | DO ->
        Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | FOR ->
        Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | IF ->
        Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | WHILE ->
        Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 54:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | DO ->
        Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 45\n%!";
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | ACOFER ->
        _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54

and _menhir_goto_int_plus_left : _menhir_env -> 'ttv_tail -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 104:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 107\n%!";
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 105\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState104 in
        Printf.fprintf Pervasives.stderr "State 105:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 106\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 106:\n%!";
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let r = _v in
            Printf.fprintf Pervasives.stderr "Reducing production int_plus_left -> int_plus_left PLUS INT \n%!";
            let ((_menhir_stack, l), _) = _menhir_stack in
            let _v : (ArithAST.t) =                               ( Bin (Plus, l, Int r) ) in
            _menhir_goto_int_plus_left _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

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

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = lexer lexbuf in
    Printf.fprintf Pervasives.stderr "Lookahead token is now %s (%d-%d)\n%!" (_menhir_print_token _tok) lexbuf.Lexing.lex_start_p.Lexing.pos_cnum lexbuf.Lexing.lex_curr_p.Lexing.pos_cnum;
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_startp = lexbuf.Lexing.lex_start_p;
      _menhir_endp = lexbuf.Lexing.lex_curr_p;
      _menhir_shifted = 1073741823;
      }

and start : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = () in
    Printf.fprintf Pervasives.stderr "State 0:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACOPEN ->
        Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 54\n%!";
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DO ->
        Printf.fprintf Pervasives.stderr "Shifting (DO) to state 53\n%!";
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | FOR ->
        Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 51\n%!";
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IF ->
        Printf.fprintf Pervasives.stderr "Shifting (IF) to state 49\n%!";
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 91\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        Printf.fprintf Pervasives.stderr "State 91:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | OPENCRO ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENCRO) to state 92\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 92:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 9\n%!";
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 8\n%!";
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 7\n%!";
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | OPENPAR ->
                Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92)
        | AND | DIVIDE | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PIN | PLUS | TIMES ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN | ME | MM | PE | PP ->
            _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | WHILE ->
        Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and start1 : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = () in
    Printf.fprintf Pervasives.stderr "State 101:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 102\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 102:\n%!";
        let _ = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let i = _v in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_left -> INT \n%!";
        let _v : (ArithAST.t) =                               ( Int i ) in
        _menhir_goto_int_plus_left _menhir_env _menhir_stack _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)



