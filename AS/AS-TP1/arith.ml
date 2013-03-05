
open ArithAST
open Toolkit
open Helper

let load = file_loader Arithpar.start Arithlex.token

let cmd_line l =
  let path = "arith.in" in
  let ast = load path in
  let ast_dot = dot ast in
  
    Dot.prnt_txt ast_dot;
    Dot.prnt_str ast_dot;
    Dot.prnt_dot ast_dot
  
  
let _ = pl "================================ ARITH ================================";
  cmd_line (tl al) 

