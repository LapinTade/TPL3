
open Toolkit
open List

(* print nice visual trees ! *)
module Dot = struct
type id = int
type lbl = string

type dot = N of lbl * dot list

type doti = NI of id * lbl * doti list

let rec ids =
  let _i = ref (-1) in let fresh() = incr _i; !_i in
  function N(lbl,chlds) -> NI (fresh(),lbl, map ids chlds)

let prnt_dot t =
  let oc,os,_,close = get_file_wrt "ast.dot"
  and t = ids t in
  os "digraph AST {\n";
  os "node [shape=\"box\",style=\"filled\",fillcolor=\"cornsilk\"]";
  let rec z = function NI (id,lbl,chlds) ->
    fpf oc "%d [label=\"%s\"]\n" id lbl;
    iter (fun c ->
      let NI(cid,_,_) = c in
      fpf oc "%d -> %d\n" id cid
    ) chlds;
    iter z chlds
  in z t;
  os "}\n";
  close();
  exec "dot -Tpng ast.dot > ast.png"

(*  print text-tree representation  *)
let prnt_txt t =
  let space d = ps $ "\n> " ^ repeat_pattern "  " d in
  let rec z d = function N (s,l) ->
    space d; ps s;
    let zz = z (d+1) in iter zz l
  in z 0 t; pnl()

(* give nested string representation  *)
let prnt_str t = let rec z = function
  | N(s,[]) -> s
  | N(s,[x]) -> spf "%s%s" s (z x)
  | N(s,[l;r]) -> spf "(%s %s %s)" (z l) s (z r)
  | N(s,l) -> spf "[%s %s]" s (pretty_print_list id " " "" "" (map z l))
  in pl$ z t
  
end
(***********************)

let file_loader par_start lex_token path =
  let lexbuf = Lexing.from_channel (open_in path) in
  lexbuf.Lexing.lex_curr_p <-
  {lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = path};
  let r = par_start lex_token lexbuf in
  Parsing.clear_parser(); r (* todo: close channel properly *)
