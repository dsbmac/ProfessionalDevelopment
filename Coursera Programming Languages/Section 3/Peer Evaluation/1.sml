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
(*-- PROBLEM 1  ------------------------------------------------------------*)

fun only_capitals xs =
    List.filter (fn str => Char.isUpper (String.sub (str,0))) xs

(*-- PROBLEM 2  ------------------------------------------------------------*)

fun longest_string1 xs =
 List.foldl (fn (x,acc) => 
	if (String.size x) > (String.size acc) then x else acc) "" xs

(*-- PROBLEM 3  ------------------------------------------------------------*)

fun longest_string2 xs = 
 List.foldl (fn (x,acc) => 
	if (String.size x) >= (String.size acc) then x else acc) "" xs

(*-- PROBLEM 4  ------------------------------------------------------------*)

fun longest_string_helper f xs   =
 List.foldl (fn (x,acc) =>
		if f(String.size x,String.size acc) then x else acc) "" xs

val longest_string3 = fn xs => longest_string_helper (fn (v,w) => v > w) xs 
val longest_string4 = fn xs => longest_string_helper (fn (v,w) => v >= w) xs

(*-- PROBLEM 5  ------------------------------------------------------------*)

val longest_capitalized = longest_string1 o only_capitals

(*-- PROBLEM 6 -------------------------------------------------------------*)

val rev_string = String.implode o List.rev o String.explode

(*-- PROBLEM 7  ------------------------------------------------------------*)

fun first_answer f = fn alist =>
    case alist of
	[] => raise NoAnswer
      | a1::alist' => case f(a1) of
 			 SOME (b) => b
		       | NONE => first_answer  f alist'
   
(*-- PROBLEM 8  ------------------------------------------------------------*)

fun all_answers f alist = 
 let fun helper (acc,xs) = 
   case xs of
       [] => SOME acc
     | x::xs' => case f(x) of
			 SOME (ys) => helper (ys @ acc,xs')
		       | NONE => NONE
 in 
     helper ([],alist)
end

(*-- PROBLEM 9  ------------------------------------------------------------*)

val count_wildcards  = g (fn ()  => 1) (fn _ => 0) 
val count_wild_and_variable_lengths = g (fn() => 1) (fn x => String.size(x))
fun count_some_var (y,p) = g (fn() => 0) (fn x => if x = y then 1 else 0) p

(*-- PROBLEM 10  ------------------------------------------------------------*)

fun check_pat p = 
    let fun get_variable_strings (pat,vlist) =   (* make variable str list *)
	    case pat of
		Variable x => x :: vlist
	     |  TupleP ps => List.foldl(fn(p,i)=>
					   (get_variable_strings(p,i))) vlist ps
             |  ConstructorP(_,p) => get_variable_strings (p,vlist)
	     |  _ => vlist
     in
	let fun any_doubles vars =        (* determine if any doubles in list *)
		case vars of
		    [] => true
		 |  v::vars' => if List.exists (fn x=> x = v) vars' 
				then false
				else any_doubles (vars')
	in
	    any_doubles (get_variable_strings(p,[]))
	end
     end


(*-- PROBLEM 11  ------------------------------------------------------------*)

fun match (vals, pat) =
    case (vals,pat) of
	(_,Wildcard) => SOME []
      | (_, Variable s) => SOME [(s,vals)]
      | (Unit,UnitP) => SOME []
      | (Const x, ConstP y) => if x = y then SOME [] else NONE
      | (Tuple vs, TupleP ps) => if List.length vs <> List.length ps
				 then NONE
				 else all_answers match (ListPair.zip(vs,ps))  
      | (Constructor (s1,v), ConstructorP(s2,p)) => if s1 = s2 
						   then match(v,p)
						   else NONE
      | (_,_) => NONE

(*-- PROBLEM 12  ------------------------------------------------------------*)

fun first_match  val1 patlist  =
    SOME (first_answer (fn (v,p) => match (v,p))
	  (List.map (fn p1 => (val1,p1)) patlist) )
    handle NoAnswer => NONE 
