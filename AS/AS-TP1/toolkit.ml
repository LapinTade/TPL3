
(*
 * OCaml Toolkit
 * 
 * by Vincent Hugot
 * 
 * vincent-hugot.com
 * vincent.hugot@gmail.com
 * 
 * Copyright 2007-2013 Vincent Hugot
 * 
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 * 
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 * 
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 *)

(** 
  Some small functions and shortcuts which I find convenient.
  
  @author Vincent Hugot
*)

(** Shortcut for oft-used hash table module *)
module H = Hashtbl

(** {6 Miscellaneous} *)

(** Functions composition operator *)
let (%) f g x = f (g x)

(** Piped functions composition operator *)
let (%>) f g x = g (f x)

(** Function application operator (read "of"). This is used to avoid LISP-like parentheses creep;
  the point of using an [@...] operator is that it has just the right precedence and is right-associative *)
let (@@) f x = f x

(** Same, but watch out: low precedence and left-associative; use f%g%g$x patterns only *)
let ($) f x = f x

(** Pipe operator *)
let (|>) x f = f x

(** Member of a list*)
let (@:) = List.mem 


(** Curry and uncurry functions *)
let curry f x y = f (x,y)
let uncurry f (x,y) = f x y
let curry3 f x y z = f (x,y,z)
let uncurry3 f (x,y,z) = f x y z

(** flip curried arguments *)
let flip f x y = f y x

(** Identity *)
let id s = s
let return = id

(** negation of predicate *)
let neg f x = not (f x)
let neg2 f x y = not (f x y)

(** Implication *)
let (==>) p q = (not p) || q

(** Incrementation etc *)
let ( += ) var x = var := !var + x
let ( *= ) var x = var := !var * x
let ( @= ) vls l = vls := l @ !vls

(** Exception used purely for flow control in imperative style *)
exception Jump;;

(** Jump with boolean value *)
exception JumpB of bool;;

(** Jump with integer value *)
exception JumpI of int;;

(** Chain several comparisons by decreasing order of importance *)
let chain_compares cmps x y =
  let rec z = function
  | c :: l -> let res = c x y in if res = 0 then z l else res
  | [] -> 0
  in z cmps

(** Create an order between lists of elements, given an order 
  between elements *)
let compare_lists cmp l l' = 
  let rec z l l' = match l,l' with
  | x::l , x'::l' -> 
    let res = cmp x x' in
    if res = 0 then z l l' else res
  | [],[] -> 0
  | [], _ -> -1
  | _, [] -> 1
  in z l l'

(** Transform a function into a totally memoized version
    of itself. Note that recursive calls the function might make
    are not memoized *)
let memoize ?(sz=32) f = 
  let h = H.create sz in fun x -> 
  try H.find h x with Not_found -> 
    let res = f x in
    H.add h x res; res

let memoize2 ?(sz=32) f = 
  curry (memoize ~sz:sz (uncurry f))

let memoize3 ?(sz=32) f = 
  curry3 (memoize ~sz:sz (uncurry3 f))
  
(** Transform a recursive function into a totally memoized version
    of itself. In order to allow memoization of recursive calls,
    the function must take an extra "self" argument, and use
    it for recursive calls. (got that idea from code by Andrej Bauer)
    Example: 
    [let fib_memo = 
    let rec fib self = function 0 -> 0 | 1 -> 1 | n -> self (n - 1) + self (n - 2) 
    in memoize_rec fib] *)
let memoize_rec ?(sz=32) f =
  let h = H.create sz in
  let rec g x = 
    try H.find h x with Not_found -> 
      let res = f g x in
      H.add h x res; res
  in g

module Memo (Ord : Map.OrderedType) = struct
  module M = Map.Make(Ord)
  
  let mem f = 
    let map = ref M.empty in
    fun x -> try M.find x !map with Not_found ->
      let res = f x in map := M.add x res !map; res

end

(** [finally tryme final failedval] will execute [tryme()], and then [final()] even if
an exception is raised, in which case it will return [failedval]. *)
let finally tryme final failedval =
  try let res = tryme() in final(); res
  with x -> final(); failedval

(** Compute a fixpoint of a fonction, given an initial value. *)
let rec fixpoint ?(stop=(=)) f x =
  let y = f x in if stop x y then x else fixpoint ~stop f y

(** {6 About options and references types...} *)

(** Toggle an option on and off *)
let toggle br = br := not !br

exception Empty_option

(** Get the contents of an option, fail if None *)
let opt_get = function
  | None -> raise Empty_option 
  | Some x -> x

(** Get the contents of an option, use a default value if None *)
let opt_getd d = function
  | None -> d
  | Some x -> x 
  
(** Find element in an Hashtable: returns None instead of raise Not_found *)
let hfind'o ht x = 
  try Some (H.find ht x)
  with Not_found -> None

let opt_is_Some = function
  Some _ -> true | _ -> false
  
(** Modified Global module from Extlib library, Copyright (C) 2003 Nicolas Cannasse 

Mutable global variable.
 
	Often in OCaml you want to have a global variable, which is mutable 
    and uninitialized when declared. You can use a ['a option ref] but
	this is not very convenient. The Global module provides functions
	to easily create and manipulate such variables.
*)
module Global = struct

  (** Raised when a global variable is accessed without first having been
  assigned a value. The parameter contains the name of the global. *)  
  exception Global_not_initialized of string
  
  (** Abstract type of a global *)
  type 'a t = ('a option ref * string)
  
  (** Returns an new named empty global. The name of the global can be any
 string. It identifies the global and makes debugging easier. *)
  let empty name = ref None,name
  
  (** Retrieve the name of a global. *)
  let name = snd
  
  (** Set the global value contents. *)
  let set (r,_) v = r := Some v
  
  (** Get the global value contents - raise Global_not_initialized if not
 defined. *)
  let get (r,name) =
          match !r with
          | None -> raise (Global_not_initialized name)
          | Some v -> v

  (** Get the global value contents - return default value if not defined *)
  let getd d (r, _) = match !r with
    | None -> d
    | Some v -> v
  
  (** Reset the global value contents to undefined. *)
  let undef (r,_) = r := None
  
  (** Return [true] if the global value has been set. *)
  let isdef (r,_) = !r <> None
  
  (** Return [None] if the global is undefined, else [Some v] where v is the
  current global value contents. *)
  let opt (r,_) = !r
end

type 'a global = 'a Global.t

(** {6 Functions about strings and files } *)

(** Is this a blank ? *)
let is_blank_char = function ' '|'\t'|'\n'|'\r' -> true | _ -> false 

(** Trim white spaces  *)
let rec trim s =
  let l = String.length s in
  if l=0 then s 
  else if is_blank_char s.[0]   then trim (String.sub s 1 (l-1))
  else if is_blank_char s.[l-1] then trim (String.sub s 0 (l-1))
  else s

(** Note: The four next functions are taken from the Str library. 
  The reason why they are not in String is beyond me...

  I have modified the first two so that they always return the string instead of 
  raising exceptions, which is what I need most of the time.
*)

(** [first_chars s n] returns the first [n] characters of [s], and [s] itself if [n] is too big *)
let first_chars s n = try String.sub s 0 n with _ -> s
      
(** [last_chars s n] returns the last [n] characters of [s], and [s] itself if [n] is too big *)
let last_chars s n = try String.sub s (String.length s - n) n with _ -> s

(** [string_before s n] returns the substring of all characters of [s]
   that precede position [n] (excluding the character at
   position [n]). *)
let string_before s n = String.sub s 0 n        

(** [string_after s n] returns the substring of all characters of [s]
   that follow position [n] (including the character at
   position [n]). *)
let string_after s n = String.sub s n (String.length s - n)

(** Get an extract of a string, up to [n+3] chars, the extra three being the "..." if the string
  is trunctated *)
let snippet s n = if String.length s <= n then s else Str.first_chars s n ^ "..."

(** Similar in purpose to [String.sub], extracts between two positions, inclusively *)
let subb s ps pe = String.sub s ps (pe-ps)

(** Add an 's' at the end of the string if [n] > 2 *)
let pluralise s n = match abs n with 0|1 -> s | _ -> s^"s"

(** Replace by an alternative if [n] > 2 *)
let pluralise_alt s ss n = match abs n with 0|1 -> s | _ -> ss

(** Plain text for numbers *)
let text_of_number ?(zero="zero") ?(one="one") = function
  | 0 -> zero | 1 -> one | 2 -> "two" | 3 -> "three" | 4 -> "four" 
  | 5 -> "five" | 6 -> "six" | 7 -> "seven" | 8 -> "eight" 
  | 9 -> "nine" | 10 -> "ten" | 11 -> "eleven" | 12 -> "twelve" 
  | 13 -> "thirteen" 
  | n -> string_of_int n

(** Friendly count: "five things", "one thing", etc *)
let friendly_count ?alt ?(zero="no") ?(one="one") n thing =
  text_of_number ~zero:zero ~one:one n ^ " " ^
  (match alt with None -> pluralise thing n
              | Some a -> pluralise_alt thing a n)
    
(** Get rid of trailing \n *)
let rec no_newline s = let l = String.length s in match l with
  | 0 -> ""
  | _ -> if s.[l-1] = '\n' || s.[l-1] = (char_of_int 13) then no_newline (String.sub s 0 (l-1)) else s;;

(** Input a file into a list, tail-recursively, transforming each line through f (not entirely by me) *)
let lines_of_file ?(f=fun x -> x) file = 
  let chan  = (open_in file) in
  let rec input_lines_helper res =
  let sl = 
    try
      Some (input_line chan) 
    with
      End_of_file -> None 
  in match sl with
       None -> List.rev res
     | Some l -> input_lines_helper ((f l) :: res) 
  in input_lines_helper [];;

(** Run f for each line in the file *)
let run_on_file f path = let ch = open_in path in
  try while true do f (input_line ch)
  done with End_of_file -> ()

(** {6 Some shortcuts} *)

(** Get a string buffer and common operations *)
let get_buffer ?(n=1024) () = 
  let b = Buffer.create n in
  (b, Buffer.add_string b, Buffer.add_char b, fun()->Buffer.contents b)


(** Cut biiig lines *)
let cut_big_line ?(n=50) s = 
  let len = String.length s in
  let (_,_,ac,get) = get_buffer ~n:(len + len / n + 1) () in
  let count = ref 0 in
  String.iter (fun c ->
    ac c; incr count;
    if !count >= n && is_blank_char c then begin ac '\n'; count := 0 end
  ) s;
  get()

(** Get file output channel and common operations *)
let get_file_wrt path = 
  let oc = open_out path in
  (oc, output_string oc, output_char oc, fun()->close_out oc)

(** {7 Printing } *)

(** Print line to stdout *)
let pl  = print_endline
(** Print carriage return to stdout *)
let pnl = print_newline
(** Print line to stderr *)
let epl  = prerr_endline
(** Print string to stdout *)
let ps  = print_string
(** Print string to stderr *)
let eps  = prerr_string
(** = [Printf.printf]: formated printing to stdout  *)
let pf  = Printf.printf
(** = [Printf.sprintf]: formated printing to string *)
let spf = Printf.sprintf
let va  = Printf.sprintf
(** = [Printf.eprintf]: formated printing to stderr  *)
let epf = Printf.eprintf
(** = [Printf.fprintf]: formated printing to output channel  *)
let fpf = Printf.fprintf

(** {7 Lists, strings and such }*)


let rec take n = function
  | _ when n <= 0 -> []
  | [] -> []
  | x::xs -> x :: take (pred n) xs

(** Range *)

let int_range ?(d=1) n m = 
  let rec f = function
    | n when n >= m -> [m]
    | n -> n :: f (n + d)
  in
  if (n > m) then [] else f n

let (--) = int_range

let float_range ?(d=1.) x y  = 
  assert(x<=y);
  let rec f = function
    | z when z > y -> [y]
    | z -> z :: f (z +. d)
  in f x

let sum = List.fold_left (+) 0
let prod = List.fold_left ( * ) 1
let average l = (float_of_int (sum l)) /. (float_of_int (List.length l))

(** aliases to folds with more sensible order...*)
let foldl x f l = List.fold_left  f x l
let foldr x f l = List.fold_right f l x
let reducel f = function [] -> invalid_arg "reducel"
  | x::l -> List.fold_left f x l
let reducer f = function [] -> invalid_arg "reducer"
  | x::l -> List.fold_right f l x

(** cons function [::] *)
let cons x l = x::l

(** Remove the fist occurence of an element within a list.
  Not tail-recursive. *)
let rec listrm x = function a :: l ->
  if a = x then l else a :: (listrm x l) | [] -> []
    
(** Remove all occurences of an element within a list *)
let listrmall x = List.filter (fun e-> e <> x)

(** Replace the nth element of a given list *)
let replace_nth l n x =
  if n < 0 then invalid_arg "replace_nth" else
  let rec z l n =
    match l with
    | [] -> failwith "replace_nth"
    | a::l -> if n = 0 then x::l else a :: z l (n-1)
  in z l n

(** [listiteri f l] calls [f i x_i] on each element of the list [l] *)
let listiteri f l = 
  let c = ref (-1) in
  let call x = incr c; f !c x in
  List.iter call l

(** Similar to [listiteri f l], but as a map *)
let listmapi f l = 
  let c = ref (-1) in
  let call x = incr c; f !c x in
  List.map call l

(** Map a function onto a pair *)
let map_pair f (x,y) = (f x, f y)

(** Map a function onto a triple *)
let map_triple f (x,y,z) = (f x, f y, f z)

(** Get the tail of list *)  
let tl = List.tl
(** Get the head of a list*)
let hd = List.hd

(** Push a value as head of a list reference *)
let push x l = l := x :: !l

(** Get the first value on a "stack" without removing it *)
let peek stack = match !stack with
  | a::_ -> a
  | [] -> failwith "peek_stack"
  
(** Get the first value on a "stack" and remove it *)
let pop stack = match !stack with
  | a::l -> stack := l; a
  | [] -> failwith "pop_stack"
  
(** Map a function unit -> 'a on a (virtual) list of [n] units *)
let map_unit f n =
  let res = ref [] in
  for i = 1 to n do
    push (f()) res
  done; !res

(** Augment a hashset with the contents of a list *)
let hashset_augment set l = 
  let add x = H.replace set x () in
  List.iter add l
  
(** Get a hashset containing all elements of a list. Linear in the length of the list *)
let hashset_of_list ?(sz=32) l  = 
  let set = H.create sz in hashset_augment set l; set
  
(** Get the list of the keys of a hashtable *)
let hkeys h = let f k b l = k::l in H.fold f h []

(** Get the list of the associated values of a hashtable *)
let hvalues h = let f k b l = b::l in H.fold f h []

(** Get the association list equivalent to the hashtable *)
let hassoc h = let f k b l = (k, b)::l in H.fold f h []

(** Get the reversed asssociation list *)
let reverse_assoc_list l = 
  let rev (x, y) = y, x in List.map rev l

(** Is a list included in another ? [O(sum of lengths of lists)].
 (more efficient if larger list is arg 1) *)
let list_included l l' = 
  let h' = hashset_of_list l' in
  List.for_all (H.mem h') l
  
(** Is there an intersection between two lists ? [O(sum of lengths of lists)] 
(more efficient if larger list is arg 1) *)
let lists_intersect l l' = 
  let h' = hashset_of_list l' in
  List.exists (H.mem h') l
  
(** get the intersection between two lists [O(sum of lengths of lists)] 
(more efficient if larger list is arg 1) *)
let lists_intersection l l' = 
  let h' = hashset_of_list l' in
  List.filter (H.mem h') l
  
(** Do the lists contain the same elements ? (seen as sets)
(more efficient if larger list is arg 1) *)
let lists_equivalent l l' = 
  let h' = hashset_of_list l' in
  let chk x = if H.mem h' x then (H.remove h' x; true) else false
  in List.for_all chk l && H.length h' = 0
  
(** get difference between two lists seen as sets: {x in l / x not in l'} 
(more efficient if larger list is arg 1) *)
let lists_diff l l' = 
  let h' = hashset_of_list l' in
  List.filter (neg (H.mem h')) l

(** Operator to concatenate lists tailrecursively, as opposed to [@].
 Use whenever order does not matter (especially for lists seen as sets) *)
let (@<) = List.rev_append

(** Remove duplicate elements in a list, without any regard for
the order in which they were. Linear time. *)
let nub ?(sz=32) l = hkeys (hashset_of_list ~sz:sz l)

(** Returns the reversed hashtable and its domain. The original is untouched *)
let reverse_htable h = 
  let dom = ref [] in
  let hh = H.create (H.length h) in
  let f k v = H.add hh v k; push v dom in
  H.iter f h; hh , nub !dom
  
(** Does the list have duplicated elements ?  *)
let has_duplicates ?(sz=32) l  = 
  let h = H.create sz in
  let chk x = H.mem h x || (H.add h x (); false) in
  List.exists chk l    
  
(** Get list of duplicated elements of a list (elements that have [n] occurences
  appear [n-1] times) *)
let list_duplicates ?(sz=32) l  = 
  let h = H.create sz in
  let chk x = H.mem h x || (H.add h x (); false) in
  List.filter chk l

(** get symmetric difference between two lists seen as sets 
l U l' - l' /\ l = l-l' U l'-l *)
let lists_symdiff l l' =
  let h, h' = hashset_of_list l, hashset_of_list l' in
  let amb l h = List.filter (neg (H.mem h)) l in
  amb l h' @< amb l' h
  
(** get a random list of ints of length n *) 
let random_list n = 
  let rec random_list_hlp n l =
    if n <= 0 then l
    else random_list_hlp (pred n) (Random.int max_int :: l)
  in random_list_hlp n []

  
(** Flat map: map and then flatten *)
let flatmap f = List.flatten % List.map f 
  
(** "cartesian product" of two lists *)
let rec product_lists l = function
  | a :: l' -> List.map (fun x->(x, a)) l @< product_lists l l'
  | [] -> []
  
(** Couples of distinct elements taken in a list; couples appear once:
 if (a,b) is in, then (b,a) is not *)
let distinct_couples l = 
  let res = ref [] in
  let add a b = push (a,b) res in
  let rec f = function
    | a :: l -> List.iter (add a) l; f l
    | [] -> ()
  in f l; !res
  
(** Generate the powerset of a list; that is to say, the list of all sublists.
 This implementation guarantees that the elements of the resulting sublists
 will be in the same order than in the original list *)
let list_powerset l =
  let increase a = List.map (fun l->a::l) in
  let rec hlp = function 
    | [] -> [[]]
    | a :: l -> let pl = hlp l in
      (increase a pl) @< pl
  in hlp l
  
(** Generate the list of all [k]-subsequences of a list, that is to say,
 of all subsequences of the list which are of length [k] *)
let rec k_subsequences k l = 
  let add x lists = List.map (fun l->x::l) lists
  in match k, l with
  | 0, _ | _, [] -> []
  | 1, l -> List.map (fun l->[l]) l
  | k, a::l -> (add a @@ k_subsequences (k-1) l) @< k_subsequences k l     
  
(** = [string_of_float] *)
let sof = string_of_float
(** = [float_of_string] *)
let fos = float_of_string

(** = [string_of_int] *)
let soi = string_of_int

(** char list of string *)
let clos s = 
  let r = ref [] in
  let add c = push c r in
  String.iter add s;
  List.rev !r
  
(** string of char list *)
let socl cl = 
  let b = Buffer.create (List.length cl) in
  let add = Buffer.add_char b in
  List.iter add cl;
  Buffer.contents b

(** Return mirror of string *)
let string_mirror s = 
  let n = String.length s in
  let r = String.create n in
  for i = 0 to n - 1 do
    r.[i] <- s.[n - 1 - i]
  done ; r
  
(** pretty string of int: 1 000 000 instead of 1000000 *)
let psoi i = 
  let x = string_mirror @@ soi i in
  let lenx = String.length x in
  let nice x = 
    let nx = Buffer.create lenx in
    let i = ref 0 in
    while !i < lenx do
      (if !i <> 0 && !i mod 3 = 0 
        then Buffer.add_char nx ' ');
      Buffer.add_char nx x.[!i];
      incr i
    done;
    string_mirror @@ Buffer.contents nx
  in
  if lenx < 5
    then x
    else nice x


(** = [int_of_string] *)
let ios = int_of_string

(** = [int_of_float] *)
let iof = int_of_float

(** Round to nearest integer *)
let rnd x = int_of_float (floor (x +. 0.5))

(** = [float_of_int] *)
let foi = float_of_int

let int_of_bool = function true -> 1 | false -> 0
let iob = int_of_bool

(** = [Array.of_list] *)
let aol = Array.of_list
(** = [Array.to_list] *)
let loa = Array.to_list

(** Get length of a string *)
let strlen   = String.length
(** Get length of a list *)
let listlen  = List.length
(** Get length of an array *)
let arrlen   = Array.length

(** take an element at random in a list *)
let list_random l = 
  try List.nth l (Random.int @@ listlen l)
  with _ -> assert false

(** Reorder a list in all different ways *)
let reorder l = 
  let rec f = function
    | [] -> []
    | [a] -> [[a]]
    | [a;b] -> [ [a;b]; [b;a] ]
    | a :: l ->
      let nl = f l in
      let before_after e li = 
        [ (e::li); (li@[e]) ]
      in
      flatmap (before_after a) nl
  in 
  f l

(** Get a numbering for the input list *)
let list_numbering l =
  let tbl = H.create (listlen l) in
  listiteri (fun i e -> H.add tbl e i) l;
  H.find tbl
  
(** take the n first elements of the list *)
let rec list_take n = function [] -> []
  | a :: l ->  if n <= 0 then [] else a :: list_take (pred n) l

(** map only the elements which are Some *)
let list_map_some f l = let rec z = function
  | x :: l -> (match f x with Some y -> y :: z l | None -> z l)
  | [] -> []
  in z l
(** Convert a [char] to a [string] *)
let string_of_char = String.make 1

(** = [string_of_char] *)
let soc  = string_of_char

(** Get a string representation of a float, but without the dot if it's an integer *)
let soff f = 
  let i = int_of_float f in
  if float_of_int i -. f = 0. then soi i else sof f

(** [ios] with debug instructions *)
let iosd debug_msg x = try int_of_string x with Failure("int_of_string") -> begin
  pf "Conversion from string to number failed on token '%s'.\nReason: \"%s\"\n" x debug_msg ; 
  failwith "Cannot continue after type conversion failure." end
  
(** [ios] with zero in case of failure *)
let iosz x = try int_of_string x with Failure("int_of_string") -> 0

(** [fos] with zero in case of failure *)
let fosz x = try float_of_string x with Failure("float_of_string") -> 0.

(** [fos] with debug instructions *)
let fosd debug_msg x = try float_of_string x with Failure("float_of_string") -> begin
  pf "Conversion from string to float failed on token '%s'.\nReason: \"%s\"\n" x debug_msg ; 
  failwith "Cannot continue after type conversion failure." end


(** Get a random word in [chars]*, of length [n] *)
let random_word chars n =
  let up = listlen chars in
  let chars = aol chars in
  let rndc() = chars.(Random.int up) in
  map_unit rndc n
  
(** Get a pretty-printing of a list in a general way *)
let pretty_print_list tostr sep dl dr l = 
  let rec f = function
  | a::b::l ->  (tostr a) ^ sep ^ f (b::l) 
  | a::[] -> tostr a
  | [] -> ""
  in dl ^ (f l) ^ dr
  
let ppl = pretty_print_list
  
(** Get a string representation of a list of strings *)
let string_of_string_list ?(quote=fun s->"\"" ^ s ^ "\"") = 
  pretty_print_list quote "; " "[" "]"
  
let sosl = string_of_string_list
  
(** Get a string representation of a list of floats *)
let string_of_float_list =
  pretty_print_list sof "; " "[" "]"
  
(** Get a string representation of a list of ints *)
let string_of_int_list =
  pretty_print_list soi "; " "[" "]"
  
let soil = string_of_int_list

(** Get a string representation of an array of floats *)
let string_of_float_array =
  (pretty_print_list sof "; " "[" "]") % loa
  
(** Get a string representation of an array of ints *)
let string_of_int_array =
  (pretty_print_list soi "; " "[" "]") % loa
  
(** Get a string representation of a complex number *)
let string_of_complex z = (sof z.Complex.re) ^ " + i* " ^ (sof z.Complex.im)
  
(** Get a string representation of an array of complex numbers *)
let string_of_complex_array =
  (pretty_print_list string_of_complex "; " "[" "]") % loa
  
(** Get a string representation of an array of strings *)
let string_of_string_array =
  let quote s = "\"" ^ s ^ "\"" in
  (pretty_print_list quote "; " "[" "]") % loa
  
(** DEBUG: display codes for each char in a string *)
let break_string s = let n = strlen s in
  for i = 0 to n - 1 do pf "%d " (int_of_char s.[i]) done
   
(** Get the char array corresponding to a string *)
let array_of_string s = 
  let n = strlen s in
  let a = Array.make n ' ' in
  for i = 0 to n - 1 do a.(i) <- s.[i] done;
  a
  
(** Get the concatenation of the strings in a string array *)
let concat_string_array a = 
  let b = Buffer.create 10 in
  for i = 0 to arrlen a - 1 do
    Buffer.add_string b a.(i)
  done ; Buffer.contents b
   
(** Get a new hashtable from an association list,
 optionally with some extra space for new values *)  
let init_table ?(extra=0) init =
  let tbl = H.create (extra + listlen init) in
  List.iter (fun (key, data) -> H.add tbl key data) init;
  tbl

(** {7 standard channels} *)

(** [stdin] as input channel *)
let stdinc  = Pervasives.stdin
(** [stdout]  as output channel *)
let stdoutc = Pervasives.stdout
(** [stderr]  as output channel *)
let stderrc = Pervasives.stderr
  
(** [stdin] as a file descriptor *)
let stdinf  = Unix.stdin
(** [stdout] as a file descriptor *)
let stdoutf = Unix.stdout
  
(** {6 Unix tricks and sockets} *)

(** Execute shell command *)
let exec = ignore % Sys.command

(** Execute shell command with bash *)
let execs = exec % va  "$SHELL -c \"%s\""

(** Get the extension of a file, and its base name.
 "foo.bar.ext"  -->  ("foo.bar" , ".ext").
 "noext" --> ("noext", "").
 ".hid" --> ("", ".hid").
Optional argument lvl controls sub-extensions (default 1):
 lvl2 : "foo.bar.ext" --> ("foo" , ".bar.ext")
Note that "." must be followed by at least one character to be considered an extension.
 *)
let break_filename ?(lvl=1) s =
  if s = "" then "","" else
  let rec test lvl =  function
  | k when k < 0 -> -1
  | 0 -> if s.[0] = '.' then 0 else -1
  | k -> begin match s.[k], lvl with
         | '.',1 -> k
         | '.',_ -> test (pred lvl) (pred k)
         | _ -> test lvl (pred k)
  end in let k = test lvl @@ String.length s - 2 
  in if k >= 0 then (string_before s k, string_after s k)
               else (s, "")
    

(** Is this filename that of a directory ? This function is supposed to be included in [Sys], but
is not, so I've recoded it here *)
let is_directory f = 
  let s = Unix.stat f in
  s.Unix.st_kind = Unix.S_DIR

(** OS-dependant path separator *)
let path_separator = match Sys.os_type with
  | "Unix" -> "/"
  | _ -> "\\"

  (* duplicates Filename... what was I thinking ?! *)
(** get temp file; eg. mktemp "" "foo.XXX" *)
let mktemp flags template =
  let cmd = va "mktemp -t %s %s" flags template
  in
  let ic = Unix.open_process_in cmd in
  let x = input_line ic in close_in ic; x

(** = [Unix.handle_unix_error] *)
let hue = Unix.handle_unix_error
  
(** Open for writing at end of file *)
let open_out_append path = 
  open_out_gen [Open_wronly; Open_creat ; Open_append; Open_text] 0o666 path


(** Get a valid port number (that is, between 0 and 65535) from a string, or fail *)    
let getport p = let res = iosd "Invalid port number" p in
  if res < 0 || res > 65535 then begin
      pf "'%d' is not a valid port number. Must be in [0, 65535]\n" res;
      failwith "Incorrect port number"; end 
  else res
 
(** Setup a pipe with channels instead of file_descr. Optionally specify if reading is non-blocking. Blocking by default. *)
let cpipe ?(nonblock=false) () = 
  let (rdfd, wrfd) = Unix.pipe () in
  if nonblock then Unix.set_nonblock rdfd;
  let rd = Unix.in_channel_of_descr rdfd in
  let wr = Unix.out_channel_of_descr wrfd in
  (rd, wr)
    
(**
  Piped double fork, leaving no zombie process behind.
 @param nb is reading non-blocking ?
 @param f  function the son will be executing. It takes two arguments: the channels reading from the son and writing to the son, respectively.
 @return couple of channels [(channel reading from the son, channel writing to the son)]
*)
let pdfork ?(nb=false) f = 
  let getchans() = cpipe ~nonblock:nb () in
  let srd, dwr = getchans() and drd, swr = getchans() in (* crossed pipes *)
  let close_dad ()= close_in drd; close_out dwr   in (* close the ends of the dad *)
  let close_son ()= close_in srd; close_out swr   in (* close the ends of the son *)
    match Unix.fork() with
      | 0 -> (if Unix.fork() <> 0 then () else begin close_dad(); f srd swr end); exit 0
      | n ->  ignore (Unix.waitpid [] n) ; close_son(); drd, dwr
  
(** Do an [input_line] for non-blocking channels. [None] is returned if nothing is there. *)
let peek_line ic = try Some(input_line ic) with _ -> None
  
(** Display a human-legible internet address in IP:port format*)
let string_of_sockaddr = function
  | Unix.ADDR_INET (a_ip, p) -> let ip = Unix.string_of_inet_addr a_ip in va "%s:%d" ip p
  | _ -> "???"
      
(** Build a string by repeating the same pattern n times. Useful for drawing terminal lines etc *)
let rec repeat_pattern s = function n when n <= 0 -> "" | n ->
  if String.length s = 1 then String.make n s.[0]
  else s ^ repeat_pattern s (pred n)

(** {6 Command-line} *)
 
(** Array of command-line arguments *)
let av = Sys.argv
(** Number of command-line arguments *)
let ac = Array.length av
(** List of command-line arguments *)
let al = Array.to_list av    

(** Incorrect command-line arguments routine: prints all arguments, insults user, and fails.  *)
let bad_args onarg = begin 
  if onarg <> "" then epf "Failed on argument `%s'!\n" onarg;
  epf "Incorrect runtime arguments ! Run '%s --help' to see help.\n\n" av.(0);  
  let i = ref 0 in Array.iter (function x -> (epf "argument %d: <%s>\n" !i x ; i := !i+1)) av ; 
end


(** {6 Other modules} *)

(** 
  Disjoint Set data structure. 

  A {i very} fast data structure to deal with the partitionning of a set into
  several, non-overlapping subsets. Can be seen as an equivalence relation.
  
  @author Vincent Hugot
*)
module DisjointSet = struct
  
  (** Internal record of rank and parent *)
  type 'a record = { mutable parent : 'a; mutable rank : int }
  
  (** Type of disjoint set of ['a] *)
  type 'a t = ('a, 'a record) H.t
  
  (** Create a new, empty disjoint set *)
  let create : int -> 'a t = H.create
  
  (** Add a new element in the disjoint set, originally on its own *)
  let add (s : 'a t) x = 
    if H.mem s x then failwith "DisjointSet: add(x) where x already in set";
    H.add s x {parent = x; rank = 0}
  
  (** Add a list of new elements, each on its own *)
  let add_ (s : 'a t) xl = List.iter (add s) xl
  
  (** Find the "representant" for a given element. Two elements are in the same subset iff
    their representants are the same *)
  let rec find (s : 'a t) x = 
    try let _x = H.find s x in
    if _x.parent = x then x
    else (_x.parent <- find s _x.parent ; _x.parent)
    with Not_found -> failwith "DisjointSet: find(x) where x not in set"
  
  (** Declare that elements [x] and [y] are in the same subset *)
  let union s x y = 
    let root_x, root_y = find s x, find s y in
    let _rx, _ry = H.find s root_x, H.find s root_y in
    if _rx.rank > _ry.rank then _ry.parent <- root_x
    else if _rx.rank < _ry.rank then _rx.parent <- root_y
    else if root_x <> root_y then (
      _ry.parent <- root_x; 
      _rx.rank <- succ _rx.rank )
      
  (** Declare that all elements of the list are in the same subset *)
  let union_ s = function x :: l ->
    List.iter (fun y-> union s x y) l | [] -> ()
    
  (** Determine whether two elements are in the same subset *)
  let equivalent s x y = find s x = find s y
  
  (** Number of elements in the set *)
  let cardinal (s : 'a t) = H.length s
  
  (** Get the list of elements in the set *)
  let elements (s : 'a t) = nub @@ hkeys s
  
  (** Get the list of partitions of the set, in no particular order *)
  let export (s : 'a t) = 
    let h = H.create (cardinal s) in
    let add x _ = H.add h (find s x) x in
    H.iter add s;
    let reps = nub @@ hkeys h in
    List.map (H.find_all h) reps
    
  (** Get a pretty string representation for the set; first argument is a writer for type 'a *)
  let to_string writer s = 
    let pr = pretty_print_list (pretty_print_list writer " " "<" ">") "; " "#{" "}#" in
    pr @@ export s
    
  (** Get a string representation of all the internals: tree structure and rank *)
  let internal_to_string atos (s : 'a t) = 
    let pr x {parent = p; rank = n}  = va "%s <-- %s [r=%2d]\n" (atos x) (atos p) n in 
    let b = Buffer.create 1024 in let write x r = Buffer.add_string b @@ pr x r in
    H.iter write s; Buffer.contents b
    
end

(** Shortcut to use lexing rules more flexibly 
with strings *)
let lex_str lexer s = 
  let buff = Lexing.from_string s in
  lexer buff

(** Apply a lexing rule so long as it can be applied.
  Avoids having to do a bloody recursive call at the end
  of each action... 
  The rule receives a function terminator() as its last 
  argument; using it lets the rule signify it is done. *)
let exhaust_lexer rule lex = 
  let continue = ref true in
  let term () = toggle continue in
  while !continue do rule term lex done


(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../LICENSE.     *)
(*                                                                     *)
(***********************************************************************)

(* $Id: set.mli,v 1.33 2005/07/21 14:52:45 doligez Exp $ *)

(** Sets over ordered types.

   This module implements the set data structure, given a total ordering
   function over the set elements. All operations over sets
   are purely applicative (no side-effects).
   The implementation uses balanced binary trees, and is therefore
   reasonably efficient: insertion and membership take time
   logarithmic in the size of the set, for instance.
   
   With extra bonus from Vincent Hugot
*)

module type XOrderedType =
  sig
    type t
      (** The type of the set elements. *)
    val compare : t -> t -> int
      (** A total ordering function over the set elements.
          This is a two-argument function [f] such that
          [f e1 e2] is zero if the elements [e1] and [e2] are equal,
          [f e1 e2] is strictly negative if [e1] is smaller than [e2],
          and [f e1 e2] is strictly positive if [e1] is greater than [e2].
          Example: a suitable ordering function is the generic structural
          comparison function {!Pervasives.compare}. *)
    val write: (t -> string) option
  end
(** Input signature of the functor {!Set.Make}. *)

module type Addable = sig 
  type elt
  type t
  val empty : t
  val add: elt -> t -> t 
end

module type SetSig =
  sig
    type elt
    (** The type of the set elements. *)

    type t
    (** The type of sets. *)

    val empty: t
    (** The empty set. *)

    val is_empty: t -> bool
    (** Test whether a set is empty or not. *)

    val mem: elt -> t -> bool
    (** [mem x s] tests whether [x] belongs to the set [s]. *)

    val add: elt -> t -> t
    (** [add x s] returns a set containing all elements of [s],
       plus [x]. If [x] was already in [s], [s] is returned unchanged. *)

    val singleton: elt -> t
    (** [singleton x] returns the one-element set containing only [x]. *)

    val remove: elt -> t -> t
    (** [remove x s] returns a set containing all elements of [s],
       except [x]. If [x] was not in [s], [s] is returned unchanged. *)

    val union: t -> t -> t
    (** Set union. *)

    val inter: t -> t -> t
    (** Set intersection. *)

    (** Set difference. *)
    val diff: t -> t -> t

    val compare: t -> t -> int
    (** Total ordering between sets. Can be used as the ordering function
       for doing sets of sets. *)

    val equal: t -> t -> bool
    (** [equal s1 s2] tests whether the sets [s1] and [s2] are
       equal, that is, contain equal elements. *)

    val subset: t -> t -> bool
    (** [subset s1 s2] tests whether the set [s1] is a subset of
       the set [s2]. *)

    val iter: (elt -> unit) -> t -> unit
    (** [iter f s] applies [f] in turn to all elements of [s].
       The elements of [s] are presented to [f] in increasing order
       with respect to the ordering over the type of the elements. *)

    val fold: (elt -> 'a -> 'a) -> t -> 'a -> 'a
    (** [fold f s a] computes [(f xN ... (f x2 (f x1 a))...)],
       where [x1 ... xN] are the elements of [s], in increasing order. *)

    val for_all: (elt -> bool) -> t -> bool
    (** [for_all p s] checks if all elements of the set
       satisfy the predicate [p]. *)

    val exists: (elt -> bool) -> t -> bool
    (** [exists p s] checks if at least one element of
       the set satisfies the predicate [p]. *)

    val filter: (elt -> bool) -> t -> t
    (** [filter p s] returns the set of all elements in [s]
       that satisfy predicate [p]. *)

    val partition: (elt -> bool) -> t -> t * t
    (** [partition p s] returns a pair of sets [(s1, s2)], where
       [s1] is the set of all the elements of [s] that satisfy the
       predicate [p], and [s2] is the set of all the elements of
       [s] that do not satisfy [p]. *)

    val cardinal: t -> int
    (** Return the number of elements of a set. *)

    val elements: t -> elt list
    (** Return the list of all elements of the given set.
       The returned list is sorted in increasing order with respect
       to the ordering [Ord.compare], where [Ord] is the argument
       given to {!Set.Make}. *)

    val min_elt: t -> elt
    (** Return the smallest element of the given set
       (with respect to the [Ord.compare] ordering), or raise
       [Not_found] if the set is empty. *)

    val max_elt: t -> elt
    (** Same as {!Set.S.min_elt}, but returns the largest element of the
       given set. *)

    val choose: t -> elt
    (** Return one element of the given set, or raise [Not_found] if
       the set is empty. Which element is chosen is unspecified,
       but equal elements will be chosen for equal sets. *)

    val may_choose: t -> elt option
    (** Same as [choose], but safe *)
       
    val split: elt -> t -> t * bool * t
    (** [split x s] returns a triple [(l, present, r)], where
          [l] is the set of elements of [s] that are
          strictly less than [x];
          [r] is the set of elements of [s] that are
          strictly greater than [x];
          [present] is [false] if [s] contains no element equal to [x],
          or [true] if [s] contains an element equal to [x]. *)
          
(*#out:xset_sig*)

    val of_list: elt list -> t
    (*$ "<ml>Mod.of_list</ml> $\pb{\enum x1n}$" yields the set $\set{\enum x1n}$. *)
    
    val map_to_list: (elt -> 'a) -> t -> 'a list
    (*$ "<ml>Mod.map_to_list</ml> $f$ $\set{\enum x1n}$" yields a list
        $\ell=\pb{\enum y1n}$ such that 
        for all $k\in\intRange 1n: y_k = f(x_k)$. *)
        
    val push : elt -> t ref -> unit
    (*$ "<ml>Mod.push</ml> $x$ $S^r$" adds the element $x$ to
      the set reference:
      $S^r := S^r \union \set x$. *)

    val push_ : elt list -> t ref -> unit
    (*$ "<ml>Mod.push_</ml> $\pb{\enum x1n}$ $S^r$" adds the elements of the list $\pb{\enum x1n}$ to
      the set reference:
      $S^r := S^r \union \set {\enum x1n}$. *)
    
    val pop : elt -> t ref -> unit
    (*$ "<ml>Mod.pop</ml> $x$ $S^r$" removes the element $x$ from
      the set reference:
      $S^r := S^r \setminus \set x$. *)
      
    val inter_: t list -> t
    (*$ "<ml>Mod.inter_</ml> $\pb{\enum S1n}$" yields the set
     $\inter_{k=1}^n S_k$. *)
    
    val union_: t list -> t
    (*$ "<ml>Mod.union_</ml> $\pb{\enum S1n}$" yields the set
     $\union_{k=1}^n S_k$. *)
     
    val mem_ : elt list -> t -> bool
    (*$ "<ml>Mod.mem_</ml> $\pb{\enum x1n}$ $S$" returns <ml>true</ml>
      if and only if for all $k\in\intRange 1n:\ x_k\in S$. *)
    
    val add_ : elt list -> t -> t
    (*$ "<ml>Mod.add_</ml> $\pb{\enum x1n}$ $S$" yields
    the set $S\union \set{\enum x1n}$.
    *)
    
    val iteri : (int -> elt -> unit) -> t -> unit
    (*$ "<ml>Mod.iteri</ml> $f$ $s$" applies $f$ in turn to all elements of $s$. 
    The elements of s are presented to $f$ in increasing order with 
    respect to the ordering over the type of the elements. 
    Furthermore, $f$ accepts the rank of each element as its first 
    argument, starting from zero. *)
    
    val iter2 : (elt -> elt -> unit) -> t -> t -> unit
    (*$ "<ml>Mod.iter2</ml> $f$ $s$ $s'$" applies $f$ in turn to 
    all elements of $s$ and $s'$: equivalent to 
    $f$ $x_1$ $x'_1;\dots;f$ $x_n$ $x'_n$.
    The elements of the sets are presented to $f$ in increasing order with 
    respect to the ordering over the type of the elements. *)
    
    val endo: (elt -> elt) -> t -> t
    (*$ "<ml>Mod.endo</ml> $f$ $\set{\enum x1n}$" yields
      the set $\set{\enumFun fx1n}$. *)
    
    val filter_to_list : (elt -> bool) -> t -> elt list
    (*$ "<ml>Mod.filter_to_list</ml> $P$ $\set{\enum x1n}$" yields
      the sub-list \ell\ of $\pb{\enum x1n}$ such that for any
      $x\in\ell:\ P(x)$ is true. *)
      
    val remove_: elt list -> t -> t
    (*$ "<ml>Mod.remove_</ml> $\pb{\enum x1n}$ $S$" yields the set
      $S\setminus \set{\enum x1n}$. *)
    
    val product_to_list : t list -> elt list list
    (*$ "<ml>Mod.product_to_list</ml> $\pb{\enum S1n}$" yields
    a list representation of the cartesian product $\prod=\Prod k1n S_k$
    where any $\pi\in \prod$ is represented as the list $\pb{\enum x1n}$
    where $x_k\in S_k$ for any $k\in \intRange 1n$. 
    So it yields a list of $\Prod k1n \card{S_k}$ lists of $n$
    elements each. *)
    
    val numbering : t -> (elt -> int)

    val powerset : t -> t list
    
    val powerset_filter : (t->bool) -> t -> t list
    
    val element_compare : elt -> elt -> int
    
    val take : int -> t -> t
    
    val random : t -> elt
    
    val randoms : int -> t -> t
    
    (*$*) 
    val to_string: ?card:string option -> ?sep:string -> ?op:string -> ?cl:string -> ?hook:(string -> string) -> t -> string
    (*$ Get a string representation of the set *) 
    
    val writer: elt -> string
    (*$ Get a string representation of an element of the set *) 
    (*$*)
    
    module Morph : functor (Out : Addable) -> sig
      val map : (elt -> Out.elt) -> t -> Out.t
    end
(*#out:null*)
  end
(** Output signature of the functor {!Set.Make}. *)



(** Functor building an implementation of the set structure
   given a totally ordered type. *)
module XSet(Ord: XOrderedType) : (SetSig with type elt = Ord.t) =
  struct
    type elt = Ord.t
    type t = Empty | Node of t * elt * t * int

    (* Sets are represented by balanced binary trees (the heights of the
       children differ by at most 2 *)

    let height = function
        Empty -> 0
      | Node(_, _, _, h) -> h

    (* Creates a new node with left son l, value v and right son r.
       We must have all elements of l < v < all elements of r.
       l and r must be balanced and | height l - height r | <= 2.
       Inline expansion of height for better speed. *)

    let create l v r =
      let hl = match l with Empty -> 0 | Node(_,_,_,h) -> h in
      let hr = match r with Empty -> 0 | Node(_,_,_,h) -> h in
      Node(l, v, r, (if hl >= hr then hl + 1 else hr + 1))

    (* Same as create, but performs one step of rebalancing if necessary.
       Assumes l and r balanced and | height l - height r | <= 3.
       Inline expansion of create for better speed in the most frequent case
       where no rebalancing is required. *)

    let bal l v r =
      let hl = match l with Empty -> 0 | Node(_,_,_,h) -> h in
      let hr = match r with Empty -> 0 | Node(_,_,_,h) -> h in
      if hl > hr + 2 then begin
        match l with
          Empty -> invalid_arg "Set.bal"
        | Node(ll, lv, lr, _) ->
            if height ll >= height lr then
              create ll lv (create lr v r)
            else begin
              match lr with
                Empty -> invalid_arg "Set.bal"
              | Node(lrl, lrv, lrr, _)->
                  create (create ll lv lrl) lrv (create lrr v r)
            end
      end else if hr > hl + 2 then begin
        match r with
          Empty -> invalid_arg "Set.bal"
        | Node(rl, rv, rr, _) ->
            if height rr >= height rl then
              create (create l v rl) rv rr
            else begin
              match rl with
                Empty -> invalid_arg "Set.bal"
              | Node(rll, rlv, rlr, _) ->
                  create (create l v rll) rlv (create rlr rv rr)
            end
      end else
        Node(l, v, r, (if hl >= hr then hl + 1 else hr + 1))

    (* Insertion of one element *)

    let rec add x = function
        Empty -> Node(Empty, x, Empty, 1)
      | Node(l, v, r, _) as t ->
          let c = Ord.compare x v in
          if c = 0 then t else
          if c < 0 then bal (add x l) v r else bal l v (add x r)

    (* Same as create and bal, but no assumptions are made on the
       relative heights of l and r. *)

    let rec join l v r =
      match (l, r) with
        (Empty, _) -> add v r
      | (_, Empty) -> add v l
      | (Node(ll, lv, lr, lh), Node(rl, rv, rr, rh)) ->
          if lh > rh + 2 then bal ll lv (join lr v r) else
          if rh > lh + 2 then bal (join l v rl) rv rr else
          create l v r

    (* Smallest and greatest element of a set *)

    let rec min_elt = function
        Empty -> raise Not_found
      | Node(Empty, v, r, _) -> v
      | Node(l, v, r, _) -> min_elt l

    let rec max_elt = function
        Empty -> raise Not_found
      | Node(l, v, Empty, _) -> v
      | Node(l, v, r, _) -> max_elt r

    (* Remove the smallest element of the given set *)

    let rec remove_min_elt = function
        Empty -> invalid_arg "Set.remove_min_elt"
      | Node(Empty, v, r, _) -> r
      | Node(l, v, r, _) -> bal (remove_min_elt l) v r

    (* Merge two trees l and r into one.
       All elements of l must precede the elements of r.
       Assume | height l - height r | <= 2. *)

    let merge t1 t2 =
      match (t1, t2) with
        (Empty, t) -> t
      | (t, Empty) -> t
      | (_, _) -> bal t1 (min_elt t2) (remove_min_elt t2)

    (* Merge two trees l and r into one.
       All elements of l must precede the elements of r.
       No assumption on the heights of l and r. *)

    let concat t1 t2 =
      match (t1, t2) with
        (Empty, t) -> t
      | (t, Empty) -> t
      | (_, _) -> join t1 (min_elt t2) (remove_min_elt t2)

    (* Splitting.  split x s returns a triple (l, present, r) where
        - l is the set of elements of s that are < x
        - r is the set of elements of s that are > x
        - present is false if s contains no element equal to x,
          or true if s contains an element equal to x. *)

    let rec split x = function
        Empty ->
          (Empty, false, Empty)
      | Node(l, v, r, _) ->
          let c = Ord.compare x v in
          if c = 0 then (l, true, r)
          else if c < 0 then
            let (ll, pres, rl) = split x l in (ll, pres, join rl v r)
          else
            let (lr, pres, rr) = split x r in (join l v lr, pres, rr)

    (* Implementation of the set operations *)

    let empty = Empty

    let is_empty = function Empty -> true | _ -> false

    let rec mem x = function
        Empty -> false
      | Node(l, v, r, _) ->
          let c = Ord.compare x v in
          c = 0 || mem x (if c < 0 then l else r)

    let singleton x = Node(Empty, x, Empty, 1)

    let rec remove x = function
        Empty -> Empty
      | Node(l, v, r, _) ->
          let c = Ord.compare x v in
          if c = 0 then merge l r else
          if c < 0 then bal (remove x l) v r else bal l v (remove x r)

    let rec union s1 s2 =
      match (s1, s2) with
        (Empty, t2) -> t2
      | (t1, Empty) -> t1
      | (Node(l1, v1, r1, h1), Node(l2, v2, r2, h2)) ->
          if h1 >= h2 then
            if h2 = 1 then add v2 s1 else begin
              let (l2, _, r2) = split v1 s2 in
              join (union l1 l2) v1 (union r1 r2)
            end
          else
            if h1 = 1 then add v1 s2 else begin
              let (l1, _, r1) = split v2 s1 in
              join (union l1 l2) v2 (union r1 r2)
            end

    let rec inter s1 s2 =
      match (s1, s2) with
        (Empty, t2) -> Empty
      | (t1, Empty) -> Empty
      | (Node(l1, v1, r1, _), t2) ->
          match split v1 t2 with
            (l2, false, r2) ->
              concat (inter l1 l2) (inter r1 r2)
          | (l2, true, r2) ->
              join (inter l1 l2) v1 (inter r1 r2)

    let rec diff s1 s2 =
      match (s1, s2) with
        (Empty, t2) -> Empty
      | (t1, Empty) -> t1
      | (Node(l1, v1, r1, _), t2) ->
          match split v1 t2 with
            (l2, false, r2) ->
              join (diff l1 l2) v1 (diff r1 r2)
          | (l2, true, r2) ->
              concat (diff l1 l2) (diff r1 r2)

    type enumeration = End | More of elt * t * enumeration

    let rec cons_enum s e =
      match s with
        Empty -> e
      | Node(l, v, r, _) -> cons_enum l (More(v, r, e))

    let rec compare_aux e1 e2 =
        match (e1, e2) with
        (End, End) -> 0
      | (End, _)  -> -1
      | (_, End) -> 1
      | (More(v1, r1, e1), More(v2, r2, e2)) ->
          let c = Ord.compare v1 v2 in
          if c <> 0
          then c
          else compare_aux (cons_enum r1 e1) (cons_enum r2 e2)

    let compare s1 s2 =
      compare_aux (cons_enum s1 End) (cons_enum s2 End)

    let equal s1 s2 =
      compare s1 s2 = 0

    let rec subset s1 s2 =
      match (s1, s2) with
        Empty, _ ->
          true
      | _, Empty ->
          false
      | Node (l1, v1, r1, _), (Node (l2, v2, r2, _) as t2) ->
          let c = Ord.compare v1 v2 in
          if c = 0 then
            subset l1 l2 && subset r1 r2
          else if c < 0 then
            subset (Node (l1, v1, Empty, 0)) l2 && subset r1 t2
          else
            subset (Node (Empty, v1, r1, 0)) r2 && subset l1 t2

    let rec iter f = function
        Empty -> ()
      | Node(l, v, r, _) -> iter f l; f v; iter f r

    let rec fold f s accu =
      match s with
        Empty -> accu
      | Node(l, v, r, _) -> fold f r (f v (fold f l accu))

    let rec for_all p = function
        Empty -> true
      | Node(l, v, r, _) -> p v && for_all p l && for_all p r

    let rec exists p = function
        Empty -> false
      | Node(l, v, r, _) -> p v || exists p l || exists p r

    let filter p s =
      let rec filt accu = function
        | Empty -> accu
        | Node(l, v, r, _) ->
            filt (filt (if p v then add v accu else accu) l) r in
      filt Empty s

    let partition p s =
      let rec part (t, f as accu) = function
        | Empty -> accu
        | Node(l, v, r, _) ->
            part (part (if p v then (add v t, f) else (t, add v f)) l) r in
      part (Empty, Empty) s

    let rec cardinal = function
        Empty -> 0
      | Node(l, v, r, _) -> cardinal l + 1 + cardinal r

    let rec elements_aux accu = function
        Empty -> accu
      | Node(l, v, r, _) -> elements_aux (v :: elements_aux accu r) l

    let elements s =
      elements_aux [] s

    let choose = min_elt
    
    let may_choose s = try Some (min_elt s) with Not_found -> None
    
    (*****************)
    
    let of_list l = List.fold_right add l empty
    
    let rec elements_aux_f f accu = function
        Empty -> accu
      | Node(l, v, r, _) -> elements_aux_f f (f v :: elements_aux_f f accu r) l
    let map_to_list f s = elements_aux_f f [] s
    
    module Morph (Out : Addable) = struct
      let map f s = 
        fold (fun e a -> Out.add (f e) a) s Out.empty
    end
    
    let push x s = s := add x !s
    
    let pop x s = s := remove x !s
    
    let inter_ sl = 
      assert (sl<>[]);
      List.fold_right inter (tl sl) (hd sl)
      
    let union_ sl = 
      List.fold_right union sl empty
      
    let mem_ l s = List.for_all (fun x->mem x s) l
    
    
    let add_ l s = List.fold_right add l s
    
    let push_ xl s = s := add_ xl !s
    
    let writer x = 
      let writer = match Ord.write with
        | Some f -> f
        | None -> assert false
      in writer x
    
    let to_string ?(card=Some "#") ?(sep=", ") ?(op="{") ?(cl="}") ?(hook=id) s = 
      let writer = match Ord.write with
        | Some f -> hook % f
        | None -> assert false
      in
      let b = Buffer.create 1024 in
      let first = ref true in
      let do_sep() = (if not !first then Buffer.add_string b sep) ; first := false in
      let addx x = do_sep(); Buffer.add_string b (writer x) in
      Buffer.add_string b @@ (match card with None -> "" 
        | Some x -> x ^ soi (cardinal s)) ^ op;
      iter addx s;
      Buffer.add_string b cl;
      Buffer.contents b
      
    let filter_to_list p s =
      let rec filt accu = function
        | Empty -> accu
        | Node(l, v, r, _) ->
            filt (filt (if p v then v :: accu else accu) l) r in
      filt [] s
      
    let endo f s = of_list @@ map_to_list f s
    
    let remove_ sl s = 
      List.fold_right remove sl s
      
    let product_to_list sl = 
      let rec f = function
      | [] -> []
      | [set] -> map_to_list (fun x->[x]) set
      | set::sets -> 
        let prod = f sets in
        List.flatten@@ map_to_list (fun x-> 
          (List.map (fun y->x::y) prod)) set
      in 
      f sl
      
    let rec iteri f s = 
      let c = ref 0 in
      let g x = f !c x; incr c in
      iter g s
    
    let rec iter2 f s s'= match (s,s') with
        Empty, Empty -> ()
      | Node(l, v, r, _), Node(l', v', r', _) -> iter2 f l l'; f v v'; iter2 f r r'
      | _ -> invalid_arg "XSet.iter2"

   module M = Map.Make(Ord)    
   let numbering s  x = 
     let _,map = fold (fun x (n,a) -> succ n , M.add x n a) s (0,M.empty) in
     M.find x map

   let powerset s =
    let rec z acc s =
      try
        let x = choose s in
        let news = List.map (add x) acc in
        z (acc @< news) (remove x s)
      with
        Not_found -> acc
    in
    z [empty] s
    
    let powerset_filter f s =
    let rec z acc s =
      try
        let x = choose s in
        let news = List.filter f @@ List.map (add x) acc in
        z (acc @< news) (remove x s)
      with
        Not_found -> acc
    in
    z [empty] s
    
    let element_compare = Ord.compare
    
    (* reimplement using reservoir sampling, this is terribly inefficient *)
    let random s = 
      let n = cardinal s 
      and l = elements s
      in List.nth l (Random.int n)
      
    let rec randoms n s = 
      if n <= 0 then empty else
      try
        let x = random s in
        add x (randoms (pred n) (remove x s))
      with 
        _ -> empty
        
    let rec take n s = 
      if n <= 0 || is_empty s then empty else
        let x = min_elt s in
        add x (take (pred n) (remove x s))
    
      
      
      
    
  end 

module IntSet = XSet (
  struct type t = int
  let write = Some soi
  let compare = compare
  end )


(** {6 UI: Displays} *)



(* generate a function [h] such that [h()] loops through the
hourglass symbols *)
let get_hourglass() = let rec ss = '|'::'/'::'-'::'\\'::ss in
  let s = ref ss in fun () -> s := tl !s; hd !s

(** symbols to use for drawing the progression arrow in [progress_bar]:
cyclic list of couples, [=,>] being the first *)
let rec symbols_bar = ('=','>')::('-','>')::('~','>')::('#','#')
  ::('*','*')::('|','|')::('/','/')::('\\','\\')::symbols_bar

(** [progress_bar width total x] is a [width]-characters
progress bar representation of the accomplishment of [x] tasks among [total].
If [x] exceeds total, the bar starts over for another [total] tasks,
and switches to the next arrow representation in [bar_sym]. *)
let rec progress_bar ?(bar_sym=symbols_bar) ?(bck=" ") width total x =
  if width < 2 || total <= 0 || x < 0 then invalid_arg "progress_bar";
  if x > total then progress_bar ~bar_sym:(tl bar_sym) width total (x - total)
  else let w = width - 2 and stail,shead = map_pair soc$ hd bar_sym in
  let bar = rnd$ foi x *. foi w /. foi total in let ltail,head =
  if bar=w && x=total || bar=0 then bar,"" else bar-1,shead in
  spf "[%s%s%s]" (repeat_pattern stail ltail) head (repeat_pattern bck$ w - bar)

(*let _ =
  let f = progress_bar 10 100 and h = get_hourglass() in
  for i = 0 to 100 do ignore$ repeat_pattern "  " 3000; (* sleep *)
    pf "\r%s%c %d%!" (f i) (h()) i
  done; exit 0*)


