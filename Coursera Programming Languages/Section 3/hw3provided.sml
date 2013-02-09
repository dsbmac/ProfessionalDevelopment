(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals (xs) =
    List.filter(fn x => Char.isUpper(String.sub(x,0))) xs

fun test1 () =
    let val a = "Devil"
	val b = "b"
	val c = "Corn"
	val x = only_capitals([a,b,c])
    in
	x
    end
(*
fun longest_string1 xs =
    let fun f (x,s) = 
	    if String.size x > String.size s
	    then x
	    else s
    in
	foldl f "" xs
    end
*)

fun longest_string1 xs = foldl (fn (x,y) => if String.size x > String.size y then x else y ) "" xs


fun test2 () =
    let val a = "Devil"
	val b = "b"
	val c = "Prada"
    in
	[longest_string1([a,b,c]),longest_string1([])]
    end


fun longest_string2 xs =
    let fun f (x,s) = 
	    if String.size x >= String.size s
	    then x
	    else s
    in
	foldl f "" xs
    end

fun test3 () =
    let val a = "Devil"
	val b = "Wears"
	val c = "Prada"
    in
	[longest_string2([a,b,c]),longest_string2([])]
    end

fun longest_string_helper (f,xs) = foldl (fn(x,y) => if f(String.size x, String.size y) then x else y) "" xs

fun longest_string3 xs = 
    longest_string_helper (fn (x,y) =>  x > y, xs)

fun longest_string4 xs = 
    longest_string_helper (fn (x,y) =>  x >= y, xs)

fun test3_4() =
    let val x = "The"
	val y = "Devil"
	val z = "wears"
	val a = "Prada"
	val xs = [x,y,z,a]
    in
	[longest_string3 xs, longest_string4 xs]
    end

val longest_capitalized = longest_string3 o only_capitals

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs

fun test5 () = 
    let val x = "The"
	val y = "Devil"
	val z = "wears"
	val a = "Pradas"
	val xs = [x,y,z,a]
    in
	[longest_capitalized xs]
    end

val rev_string = implode o rev o explode 

fun test6() =
    let val a = "Denis"
	val b = ""
    in 
	[rev_string a, rev_string b]
    end


fun first_answer (f,xs) = 
    let exception NoAnswer
	fun f' (acc,xs) =
	    case xs of
		[] => raise NoAnswer
	      | x::xs' => case acc of
			      SOME v => v
			    | NONE => f'(f(x),xs')
    in
	f' (NONE, xs)
    end
