
(*** You don't need to touch that file!
Vincent Hugot *)

(* extracts from my toolkit *)

(** Get file output channel and common operations *)
let get_file_wrt path =
  let oc = open_out path in
  (oc, output_string oc, output_char oc, fun()->close_out oc)

(** Print string to stdout *)
let ps  = print_string

(** Print line to stdout *)
let pl  = print_endline

(** Print carriage return to stdout *)
let pnl = print_newline

(** = [Printf.fprintf]: formated printing to output channel  *)
let fpf = Printf.fprintf

(** = [Printf.sprintf]: formated printing to string *)
let spf = Printf.sprintf

(** Functions composition operator *)
let (%) f g x = f (g x)

(** Function application operator (read "of"). This is used to avoid LISP-like parentheses creep;
  the point of using an [@...] operator is that it has just the right precedence and is right-associative *)
let (@@) f x = f x

(** Same, but watch out: low precedence and left-associative; use f%g%g$x patterns only *)
let ($) f x = f x

(** Execute shell command *)
let exec = ignore % Sys.command

(** = [string_of_float] *)
let sof = string_of_float
(** = [float_of_string] *)
let fos = float_of_string
(** = [string_of_int] *)
let soi = string_of_int
(** = [int_of_string] *)
let ios = int_of_string
(** = [int_of_float] *)
let iof = int_of_float

(** Array of command-line arguments *)
let av = Sys.argv
(** Number of command-line arguments *)
let ac = Array.length av
(** List of command-line arguments *)
let al = Array.to_list av    

(** Build a string by repeating the same pattern n times. Useful for drawing terminal lines etc *)
let rec repeat_pattern s = function n when n <= 0 -> "" | n ->
  if String.length s = 1 then String.make n s.[0]
  else s ^ repeat_pattern s (pred n)

(** Get a pretty-printing of a list in a general way *)
let pretty_print_list tostr sep dl dr l =
  let rec f = function
  | a::b::l ->  (tostr a) ^ sep ^ f (b::l)
  | a::[] -> tostr a
  | [] -> ""
  in dl ^ (f l) ^ dr

(** Identity *)
let id s = s

(** Get the tail of list *)
let tl = List.tl
(** Get the head of a list*)
let hd = List.hd

(* end extracts *)

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
