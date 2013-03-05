open List
open Toolkit
open Helper

(******************************)

type op = Plus | Times

type t =
  | Int of int
  | Float of float
  | String of string
  | Var of string
  | Bin of op * t * t


let str_of_op = function
  | Plus -> "+"
  | Times -> "*"

(* convert into DOT format *)
let rec dot = (function
  | Int i -> Dot.N ("i:" ^ soi i, [])
  | String s -> Dot.N ("s:" ^ String.escaped s, [])
  | Var s -> Dot.N ("v:" ^ String.escaped s, [])
  | Float f -> Dot.N ("f:" ^ sof f, [])
  | Bin (o,l,r) -> Dot.N (str_of_op o, [dot l; dot r])
  )



