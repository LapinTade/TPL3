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
  | GT
  | GEQ
  | FOR
  | FLOAT of (float)
  | FALSE
  | EQ
  | EOF
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
  | MenhirState116
  | MenhirState113
  | MenhirState111
  | MenhirState109
  | MenhirState106
  | MenhirState103
  | MenhirState101
  | MenhirState97
  | MenhirState92
  | MenhirState82
  | MenhirState81
  | MenhirState77
  | MenhirState74
  | MenhirState68
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState57
  | MenhirState56
  | MenhirState53
  | MenhirState51
  | MenhirState50
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState38
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
  | MenhirState19
  | MenhirState18
  | MenhirState17
  | MenhirState15
  | MenhirState14
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState5
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
    Printf.fprintf Pervasives.stderr "State 115:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 119\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 119:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start1 -> int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF \n%!";
        let ((((_menhir_stack, _1), _, _2), _, _3), _, _4) = _menhir_stack in
        let _v : (ArithAST.t) = ( Dummy ("assocs and precs", [_1;_2;_3;_4]) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 96:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = _v in
        Printf.fprintf Pervasives.stderr "Accepting\n%!";
        Obj.magic _1
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 116\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 116:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run113 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 113:\n%!";
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_goto_manual_arith_plus_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 107:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r PLUS manual_arith_plus_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
        _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 111:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)
    | _ ->
        _menhir_fail ()

and _menhir_goto_manual_arith_times_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 112:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 113\n%!";
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
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
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 117:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 113\n%!";
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
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
    | MenhirState106 | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 105:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 106\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 106:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106)
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
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 110:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom TIMES manual_arith_times_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce54 : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s b ->
    Printf.fprintf Pervasives.stderr "Reducing production stmt -> bloc \n%!";
    let _v : (ArithAST.t) =           ( b ) in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState81 | MenhirState82 | MenhirState41 | MenhirState77 | MenhirState68 | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 67:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 68\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 68:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | ACOFER | CLOSEPAR | EOF | PV ->
                _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState68
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 73:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CLOSEPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSEPAR) to state 74\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 74:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 75:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production fors -> FOR OPENPAR assign PV expr PV stmt CLOSEPAR stmt \n%!";
        let ((((((_menhir_stack, _menhir_s), _, a), _, e), _), _, s), _, s1) = _menhir_stack in
        let _v : (ArithAST.t) =                                                             ( For(a,e,s,s1) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 70:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let f = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmt -> fors \n%!";
        let _v : (ArithAST.t) =           ( f ) in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 104:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = _v in
    Printf.fprintf Pervasives.stderr "Reducing production manual_arith_atom -> INT \n%!";
    let _v : (ArithAST.t) =                                                     ( Int _1 ) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 | MenhirState109 | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 108:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 109\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 109:\n%!";
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109)
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
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 114:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_times_l TIMES manual_arith_atom \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | MenhirState111 | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 118:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_atom \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( _1 ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_whiles : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 63:\n%!";
    let _menhir_stack = Obj.magic _menhir_stack in
    let w = _v in
    Printf.fprintf Pervasives.stderr "Reducing production stmt -> whiles \n%!";
    let _v : (ArithAST.t) =             ( w ) in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce10 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production bloc -> ACOPEN stmts ACOFER \n%!";
    let ((_menhir_stack, _menhir_s), _, s) = _menhir_stack in
    let _v : (ArithAST.t) =                         (s) in
    match _menhir_s with
    | MenhirState0 | MenhirState81 | MenhirState82 | MenhirState41 | MenhirState77 | MenhirState61 | MenhirState62 | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 71:\n%!";
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 76:\n%!";
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce53 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production stmt -> assign \n%!";
    let (_menhir_stack, _menhir_s, a) = _menhir_stack in
    let _v : (ArithAST.t) =             ( a ) in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_start2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 89:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 90\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 90:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start -> start2 EOF \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                   ( _1 ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 91:\n%!";
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

and _menhir_reduce9 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production assignable -> tab \n%!";
    let (_menhir_stack, _menhir_s, t) = _menhir_stack in
    let _v : (ArithAST.t) =           (t) in
    _menhir_goto_assignable _menhir_env _menhir_stack _menhir_s _v

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 15:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 17:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 21:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 19:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_reduce31 : _menhir_env -> (('ttv_tail * _menhir_state) * _menhir_state * (ArithAST.t)) * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production expr -> OPENPAR expr CLOSEPAR \n%!";
    let (((_menhir_stack, _menhir_s), _, t), _) = _menhir_stack in
    let _v : (ArithAST.t) =                           (t) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 38:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_goto_int_plus_right : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 102:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT PLUS int_plus_right \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                               ( Bin (Plus, Int l, r) ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 103:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 104\n%!";
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmts_inner : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 | MenhirState81 | MenhirState82 | MenhirState41 | MenhirState77 | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 64:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let l = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts -> stmts_inner \n%!";
        let _v : (ArithAST.t) =                 ( Stmts l ) in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        (match _menhir_s with
        | MenhirState62 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 65:\n%!";
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACOFER ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOFER) to state 66\n%!";
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 66:\n%!";
                let _ = _menhir_discard _menhir_env in
                _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState77 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 78:\n%!";
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACOFER ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOFER) to state 79\n%!";
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 79:\n%!";
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | CLOSEPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    Printf.fprintf Pervasives.stderr "Reducing production whiles -> WHILE OPENPAR expr CLOSEPAR ACOPEN stmts ACOFER \n%!";
                    let ((((((_menhir_stack, _menhir_s), _), _, r), _), _), _, s) = _menhir_stack in
                    let _v : (ArithAST.t) =                                                       ( While(r,s) ) in
                    _menhir_goto_whiles _menhir_env _menhir_stack _menhir_s _v
                | PV ->
                    _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_shifted <- (-1);
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState41 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 80:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production whiles -> WHILE OPENPAR expr CLOSEPAR stmts \n%!";
            let (((((_menhir_stack, _menhir_s), _), _, r), _), _, s) = _menhir_stack in
            let _v : (ArithAST.t) =                                         ( While(r,s) ) in
            _menhir_goto_whiles _menhir_env _menhir_stack _menhir_s _v
        | MenhirState82 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 83:\n%!";
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ACOFER ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOFER) to state 84\n%!";
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 84:\n%!";
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | CLOSEPAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    Printf.fprintf Pervasives.stderr "Reducing production whiles -> WHILE expr ACOPEN stmts ACOFER \n%!";
                    let ((((_menhir_stack, _menhir_s), _, r), _), _, s) = _menhir_stack in
                    let _v : (ArithAST.t) =                                      ( While(r,s) ) in
                    _menhir_goto_whiles _menhir_env _menhir_stack _menhir_s _v
                | PV ->
                    _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_shifted <- (-1);
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState81 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 85:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production whiles -> WHILE expr stmts \n%!";
            let (((_menhir_stack, _menhir_s), _, r), _, s) = _menhir_stack in
            let _v : (ArithAST.t) =                        ( While(r,s) ) in
            _menhir_goto_whiles _menhir_env _menhir_stack _menhir_s _v
        | MenhirState0 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 88:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start2 -> stmts \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =        (_1) in
            _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            _menhir_fail ())
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 69:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let r = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> stmt PV stmts_inner \n%!";
        let (_menhir_stack, _menhir_s, s) = _menhir_stack in
        let _v : (ArithAST.t list) =                           ( s::r ) in
        _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_assignable : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 55:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASSIGN ->
        Printf.fprintf Pervasives.stderr "Shifting (ASSIGN) to state 56\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 56:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FALSE ->
            Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | TRUE ->
            Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_assign : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState53 ->
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
            | FALSE ->
                Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | OPENPAR ->
                Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | TRUE ->
                Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
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
    | MenhirState81 | MenhirState82 | MenhirState41 | MenhirState77 | MenhirState61 | MenhirState74 | MenhirState62 | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 72:\n%!";
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 93:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start2 -> assign \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =         (_1) in
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

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 2:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _ = _menhir_discard _menhir_env in
    _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 12:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> MINUS expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Un (UMinus,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 13:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> NOT expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Un (Not,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 14:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | CLOSEPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSEPAR) to state 37\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState14 in
            Printf.fprintf Pervasives.stderr "State 37:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _ = _menhir_discard _menhir_env in
            _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 16:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr TIMES expr \n%!";
        let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Bin (Times, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 18:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | PV | VAR _ | WHILE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr PLUS expr \n%!";
            let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                         ( Bin (Plus, l, r) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 20:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr DIVIDE expr \n%!";
        let (((_menhir_stack, _menhir_s, l), _), _, r) = _menhir_stack in
        let _v : (ArithAST.t) =                         ( Bin (Divide, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 22:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState22
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
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | FOR | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState24
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
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | NEQ | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | NEQ | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | NEQ | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | NEQ | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | GEQ | GT | LEQ | LT | NEQ | OR | PV | VAR _ | WHILE ->
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
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState36
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
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | EQ | FOR | NEQ | OR | PV | VAR _ | WHILE ->
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
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 39:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | ACOPEN | AND | CLOSECRO | CLOSEPAR | EOF | FOR | OR | PV | VAR _ | WHILE ->
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 40:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | CLOSEPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSEPAR) to state 41\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState40 in
            Printf.fprintf Pervasives.stderr "State 41:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 77\n%!";
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState41 in
                Printf.fprintf Pervasives.stderr "State 77:\n%!";
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | ACOPEN ->
                    Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
                    _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState77
                | FOR ->
                    Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState77
                | VAR _v ->
                    Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
                | WHILE ->
                    Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState77
                | ACOFER ->
                    _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState77
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77)
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | CLOSEPAR | PV ->
                _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | AND | DIVIDE | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | TIMES ->
                _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState40
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
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 45:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production assign -> VAR PE expr \n%!";
            let ((_menhir_stack, _menhir_s, v), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                   ( Assign(Var v,Bin (Plus,Var v, r)) ) in
            _menhir_goto_assign _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 47:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CLOSECRO ->
            Printf.fprintf Pervasives.stderr "Shifting (CLOSECRO) to state 48\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState47 in
            Printf.fprintf Pervasives.stderr "State 48:\n%!";
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production tab -> VAR OPENCRO expr CLOSECRO \n%!";
            let ((_menhir_stack, _menhir_s, v), _, t) = _menhir_stack in
            let _v : (ArithAST.t) =                                 ( Index(v,t) ) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState81 | MenhirState82 | MenhirState41 | MenhirState77 | MenhirState74 | MenhirState61 | MenhirState68 | MenhirState62 | MenhirState53 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 54:\n%!";
                _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
            | MenhirState0 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 87:\n%!";
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EOF ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    Printf.fprintf Pervasives.stderr "Reducing production start2 -> tab \n%!";
                    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
                    let _v : (ArithAST.t) =      (_1) in
                    _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
                | ASSIGN ->
                    _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_shifted <- (-1);
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                _menhir_fail ())
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState47
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
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 51:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production assign -> VAR ME expr \n%!";
            let ((_menhir_stack, _menhir_s, v), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                   ( Assign(Var v,Bin (Minus,Var v, r)) ) in
            _menhir_goto_assign _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 57:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | CLOSEPAR | EOF | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production assign -> assignable ASSIGN expr \n%!";
            let ((_menhir_stack, _menhir_s, a), _, r) = _menhir_stack in
            let _v : (ArithAST.t) =                              ( Assign(a,r) ) in
            _menhir_goto_assign _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 60:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PV ->
            Printf.fprintf Pervasives.stderr "Shifting (PV) to state 61\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState60 in
            Printf.fprintf Pervasives.stderr "State 61:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 81:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ACOPEN ->
            Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 82\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState81 in
            Printf.fprintf Pervasives.stderr "State 82:\n%!";
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | ACOPEN ->
                Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | FOR ->
                Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | WHILE ->
                Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ACOFER ->
                _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | FOR ->
            Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
        | WHILE ->
            Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | CLOSEPAR | PV ->
            _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 92:\n%!";
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 35\n%!";
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 33\n%!";
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start2 -> expr \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =       (_1) in
            _menhir_goto_start2 _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92)
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 42:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | ME ->
        Printf.fprintf Pervasives.stderr "Shifting (ME) to state 50\n%!";
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
    | MM ->
        Printf.fprintf Pervasives.stderr "Shifting (MM) to state 49\n%!";
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
    | OPENCRO ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENCRO) to state 46\n%!";
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
    | PE ->
        Printf.fprintf Pervasives.stderr "Shifting (PE) to state 44\n%!";
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
    | PP ->
        Printf.fprintf Pervasives.stderr "Shifting (PP) to state 43\n%!";
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
    | ASSIGN ->
        _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 100:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 101\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 101:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 100\n%!";
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)
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

and _menhir_reduce58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> \n%!";
    let _v : (ArithAST.t list) =   ( [] ) in
    _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 1:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 5\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState1 in
        Printf.fprintf Pervasives.stderr "State 5:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | FALSE ->
            Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | FLOAT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | NOT ->
            Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | OPENPAR ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | STRING _v ->
            Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | TRUE ->
            Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
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
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce8 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production assignable -> VAR \n%!";
    let (_menhir_stack, _menhir_s, v) = _menhir_stack in
    let _v : (ArithAST.t) =           ( Var v ) in
    _menhir_goto_assignable _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce16 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR \n%!";
    let (_menhir_stack, _menhir_s, s) = _menhir_stack in
    let _v : (ArithAST.t) =                         ( Var s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 43:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production assign -> VAR PP \n%!";
    let (_menhir_stack, _menhir_s, v) = _menhir_stack in
    let _v : (ArithAST.t) =            ( Assign(Var v,Bin (Plus,Var v, Int 1)) ) in
    _menhir_goto_assign _menhir_env _menhir_stack _menhir_s _v

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 44:\n%!";
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 46:\n%!";
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 49:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production assign -> VAR MM \n%!";
    let (_menhir_stack, _menhir_s, v) = _menhir_stack in
    let _v : (ArithAST.t) =            ( Assign(Var v,Bin (Minus,Var v, Int 1)) ) in
    _menhir_goto_assign _menhir_env _menhir_stack _menhir_s _v

and _menhir_run50 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 50:\n%!";
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 3:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> TRUE \n%!";
    let t = () in
    let _v : (ArithAST.t) =           ( True ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 4:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let s = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> STRING \n%!";
    let _v : (ArithAST.t) =                         ( String s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 6:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
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
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 8:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 9:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let i = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> INT \n%!";
    let _v : (ArithAST.t) =                         ( Int i ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 52:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 53\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 53:\n%!";
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | VAR _v ->
            Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (float) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 10:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let f = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FLOAT \n%!";
    let _v : (ArithAST.t) =                         ( Float f ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 11:\n%!";
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FALSE \n%!";
    let f = () in
    let _v : (ArithAST.t) =            ( False ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 62:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | ACOPEN ->
        Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | FOR ->
        Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 42\n%!";
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | WHILE ->
        Printf.fprintf Pervasives.stderr "Shifting (WHILE) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | ACOFER ->
        _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62

and _menhir_goto_int_plus_left : _menhir_env -> 'ttv_tail -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 97:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 100\n%!";
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 98\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState97 in
        Printf.fprintf Pervasives.stderr "State 98:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 99\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 99:\n%!";
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

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
        Printf.fprintf Pervasives.stderr "Shifting (ACOPEN) to state 62\n%!";
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | FOR ->
        Printf.fprintf Pervasives.stderr "Shifting (FOR) to state 52\n%!";
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OPENPAR ->
        Printf.fprintf Pervasives.stderr "Shifting (OPENPAR) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 86\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        Printf.fprintf Pervasives.stderr "State 86:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | ME ->
            Printf.fprintf Pervasives.stderr "Shifting (ME) to state 50\n%!";
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack)
        | MM ->
            Printf.fprintf Pervasives.stderr "Shifting (MM) to state 49\n%!";
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | OPENCRO ->
            Printf.fprintf Pervasives.stderr "Shifting (OPENCRO) to state 46\n%!";
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | PE ->
            Printf.fprintf Pervasives.stderr "Shifting (PE) to state 44\n%!";
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | PP ->
            Printf.fprintf Pervasives.stderr "Shifting (PP) to state 43\n%!";
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | AND | DIVIDE | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | TIMES ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack)
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
    | EOF ->
        _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and start1 : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = () in
    Printf.fprintf Pervasives.stderr "State 94:\n%!";
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 95\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 95:\n%!";
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



