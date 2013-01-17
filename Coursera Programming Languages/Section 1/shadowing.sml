val a = 10

(* a : int
   a -> 10 *)

val b = a * 2

(* b -> 20 *)

val a = 5 (* this is not an assignment statement *)

(* a -> 5, b -> 20, c -> 20 *)

val c = b

val d = a

val a = a + 1
