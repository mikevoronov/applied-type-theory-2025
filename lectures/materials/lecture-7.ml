(* A -> A
  forall 'a. 'a -> 'a
  \x.x
*)
let id: 'a -> 'a = fun x -> x

(* A -> B -> A
   K = \xy.x
*)
let k: 'a -> 'b -> 'a = fun x y -> x

(*
    (A -> B -> C) -> (A -> B) -> A -> C
    S = \fgx.f x (g x)
*)
let s: ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c = fun f g x -> f x (g x)

(*
  A*B -> A
*)
let proj_l: ('a * 'b) -> 'a = fun (a, b) -> a

(*
  A*B -> B
*)
let proj_l: ('a * 'b) -> 'a = fun (a, b) -> b

type unit = 
  | T

type void = |

(* A -> T *)
let intro_unit: 'a -> unit = fun x -> T

(* A -> Void
   0^|A| = 0

let intro_void: 'a -> void = fun x -> ...
*)

(* Void -> Void
   0^0 = 1
*)
let id_void: void -> void = fun x -> x

(* Void -> A
   |A|^0 = 1
*)
let void_elim: void -> 'a = fun x ->
  match x with _ -> .

(* (A -> B) -> (!B -> !A) 
  !B == B -> 0
*)
let left_contraposition: ('a -> 'b) -> ('b -> void) -> 'a -> void = fun f g x -> g (f x)

(* 
  (!B -> !A) -> (A -> B)
  !B == B -> 0
*)
let right_contraposition: (('b -> void) -> 'a -> void) -> 'a -> 'b = fun f x -> f (fun y -> void_elim y) x

type ('a, 'b) coprod =
  | Left of 'a
  | Right of 'b

(* (A /\ (B \/ C)) -> ((A /\ B) \/ (A /\ C)) *)
let distrib: ('a * ('b, 'c) coprod) -> (('a * 'b) , ('a * 'c)) coprod = fun (a, bc) -> match bc with
  | Left b -> Left (a, b)
  | Right c -> Right (a, c)

(* Unit -> Void == Void *)
let left: (unit -> void) -> void = fun f -> f T
let right: void -> unit -> void = fun x y -> x

(* Void -> Void == Unit *)
let left: (void -> void) -> unit = fun f -> T
let right: unit -> void -> void = fun x y -> y

(*
  left . right = id : Unit -> Unit
  fight . left = id : (Void -> Void) -> Void -> Void
*)

(*
 A === B  ?

 f: A -> B 
 f^{-1}: B -> A

 (f . f^{-1}) = id_{B}: B -> B
 (f^{-1} . f) = id_{A}: A -> A

 g == f . f^{-1} : 

 (f . f^{-1}) x === (f (f^{-1} x))

*)

let absurd: 'a -> 'b = fun x -> raise Not_found

let void_instance: void = absurd T

(* *)
let excl_third: unit -> ('a -> void, 'a) coprod = fun T -> void_elim void_instance

(* (A /\ B) -> (C \/ D) -> (D -> F) -> (C -> G) -> ((A /\ F) \/ (B /\ G) *)
let t: ('a * 'b) -> ('d, 'c) coprod -> ('d -> 'f) -> ('c -> 'g) -> (('a * 'f), ('b * 'g)) coprod = fun (a, b) d_or_c d_to_f c_to_g ->
  match d_or_c with
  | Left d -> Left (a, d_to_f d)
  | Right c -> Right (b, c_to_g c)
