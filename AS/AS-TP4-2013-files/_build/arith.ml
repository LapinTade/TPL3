
open ArithAST
open Helper

let load p = try file_loader Arithpar.start Arithlex.token p
  with _ -> pl "ERROR DURING PARSING: see parser-action.log."; failwith "<parsing error>"

let cmd_line l =
  let path = "arith.in" in
  let ast = load path in
  let ast_dot = dot ast in
  Dot.prnt_txt ast_dot;
  Dot.prnt_str ast_dot;
  Dot.prnt_dot ast_dot
  
let _ = pl "================================ ARITH ================================";
  cmd_line (tl al)

