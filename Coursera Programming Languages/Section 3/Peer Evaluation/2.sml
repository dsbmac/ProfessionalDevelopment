(* Coursera Programming Languages, Homework 3, Provided Code *)

val only_capitals = List.filter (fn x => Char.isUpper (String.sub (x,0)))

val longest_string1 = foldl (fn (x,y) => if String.size x > String.size y
					 then x
					 else y) ""
val longest_string2 = foldl (fn (x,y) => if String.size x >= String.size y
					 then x
					 else y) ""

fun longest_string_helper f = foldl (fn (x,y) => if f (String.size x, String.size y)
					 then x
					 else y) ""

val longest_string3 = longest_string_helper (op >) (* op converts an infix operator to prefix *)

val longest_string4 = longest_string_helper (op >=)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o rev o String.explode

exception NoAnswer

fun first_answer f xs = 
    case  xs of
	[] => raise NoAnswer
      | x::xs'  =>  case (f x) of
			NONE => first_answer f xs'
		     |  (SOME b) =>  b


fun all_answers f xs =
    let fun helper xs acc = 
	case xs of
	    [] => SOME acc
	 |  (x::xs') => case (f x) of
			    NONE => NONE
			  | (SOME lst)  => helper xs' (acc @ lst)
    in
	helper xs []
    end


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

val count_wildcards = g (fn () => 1) (fn x => 0)

val count_wild_and_variable_lengths = g (fn () => 1) (fn x => String.size x)

fun count_some_var (var, ps) = g (fn () => 0) (fn x => if (x = var) then 1 else 0) ps

fun h p =
    case p of
	Wildcard          => []
      | Variable x        => [x]
      | TupleP ps         => List.foldl (fn (p,i) => (h p) @ i) [] ps
      | ConstructorP(_,p) => h p
      | _                 => []

fun check_unique xs =
    case xs of
	[] =>  true
      | (x::xs') => not (List.exists (fn y => y = x) xs') andalso check_unique xs'

val check_pat = check_unique o h

fun match (va, pt) =
    case (va, pt) of
	(_,Wildcard)            => SOME []
      | (_, Variable x)         => SOME [(x, va)]
      | (t, UnitP)              => if (t <> Unit) then NONE else SOME []
      | (Const y, ConstP x)     => if (x <> y) then NONE else SOME []
      | (Tuple vs, TupleP ps)   => if (length ps <> length vs) then NONE 
				   else all_answers match (ListPair.zip(vs,ps))
      | (Constructor(s2,v), ConstructorP(s1,p))  =>  if (s1 <> s2) then NONE
						     else match(v,p)
      | (_,_)                   => NONE

fun first_match va pts = 
    SOME (first_answer (fn p => match(va,p)) pts) handle NoAnswer => NONE
(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
(**
fun has_type (ptn, tp) =
    case (ptn, tp) of
	(_, Anything)             => true
      | (Wildcard, _)             => true
      | (Variable x, _)           => true
      | (UnitP, UnitT)            => true
      | (ConstP x, IntT)          => true
      | (TupleP ps, TupleT ts)    => if (length ps <> length ts) then false
				     else foldl (fn x y => has_type x andalso y) true (ListPair.zip(ps,vs)) 
      | (ConstructorP(s1,p),(s2,s3,t))  => if (s1 <> s2) then false
					   else has_type(p,t)
      | (_,_)                     => false 
    
**)



