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




fun longest_string2 xs =
    let fun f (x,s) = 
	    if String.size x >= String.size s
	    then x
	    else s
    in
	foldl f "" xs
    end



fun longest_string_helper (f,xs) = foldl (fn(x,y) => if f(String.size x, String.size y) then x else y) "" xs

fun longest_string3 xs = 
    longest_string_helper (fn (x,y) =>  x > y, xs)

fun longest_string4 xs = 
    longest_string_helper (fn (x,y) =>  x >= y, xs)


val longest_capitalized = longest_string3 o only_capitals

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs


val rev_string = implode o rev o explode 


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

fun all_answers (f,xs) = 
    let fun f' (acc,xs) =
	    case xs of
		[] => SOME acc
	      | x::xs' => case f(x) of
			      NONE => NONE
			    | SOME ys => f'(ys@acc,xs')
    in
	f' ([], xs)
    end

			    
fun count_some_var (str, pat) =
    let	fun f1 () = 0
	    
	fun f2 s = 
	    case s=str of
		true => 1
	      | false => 0
    in
	g f1 f2 pat
    end





fun count_wildcards (pat) = 
    let	fun f1 () = 1
	    
	fun f2 x = 0
    in
	g f1 f2 pat
    end

fun count_wild_and_variable_lengths pat = 
    let	fun f1 () = 1
	    
	fun f2 s = 
	    case s of
		s => String.size s

    in
	g f1 f2 pat
    end

fun check_pat pat = 
    let
	fun f1 p = 
	    case p of
		Wildcard => []
	      | Variable s => [s]
	      | UnitP => []
	      | ConstP _ => []
	      | TupleP ps => foldl (fn (p,i) => f1 p @ i) [] ps
	      | ConstructorP (s',p') => f1 p'
	fun f2 strs =
	    case strs of
		[] => false
	      | s::strs' => List.exists (fn x => x = s) strs'

    in
	not (f2 (f1 pat))
    end


(*
fun match (v, pat) =
    case pat of
 	Wildcard => SOME []
      | Variable s => SOME [(s,v)]
      | UnitP => SOME []
      | ConstP x => SOME [] 
      | TupleP => 
      | _ => SOME []
*)
