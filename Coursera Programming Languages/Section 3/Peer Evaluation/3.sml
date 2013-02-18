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

(**** you can put all your code here ****)

(* 1 *)

fun only_capitals (xs : string list) =
    List.filter (fn x => (Char.isUpper o String.sub) (x,0)) xs;

(* 2 *)

fun longest_string1 (xs : string list) =
    foldl (fn (x,y) => if String.size x > String.size y then x else y) "" xs;

(* 3 *)

fun longest_string2 (xs : string list) =
    foldl (fn (x,y) => if String.size x >= String.size y then x else y) "" xs;

(* 4 *)

fun longest_string_helper comp xs =
    foldl (fn (x,y) => if comp (String.size x, String.size y) then x else y) "" xs;

val longest_string3 = longest_string_helper (fn (x,y) => x > y);

val longest_string4 = longest_string_helper (fn (x,y) => x >= y);

(* 5 *)

val longest_capitalized = longest_string1 o only_capitals;

(* 6 *)

val rev_string = String.implode o rev o String.explode;

(* 7 *)

fun first_answer f xs =
    case foldr (fn (x,y) => if isSome x then x else y) NONE (map f xs) of
	NONE => raise NoAnswer
      | SOME x => x;

(* 8 *)

fun all_answers f xs =   
    let val mapped = map f xs in
	if List.exists (not o isSome) mapped
	then NONE
	else SOME (foldl (fn (acc,x) => acc @ x) [] (map valOf (List.filter isSome mapped)))
    end;

(* 9 *)

val count_wildcards = g (fn _ => 1) (fn s => 0);

val count_wild_and_variable_lengths = g (fn _ => 1) String.size;

fun count_some_var (s : string, p : pattern) =
    g (fn x => 0) (fn s' => if s = s' then 1 else 0) p;


(* 10 *)

fun check_pat (pat : pattern) =
    let
	fun var_names (p : pattern) =
	    case p of
		Variable x        => [x]
	      | TupleP ps         => List.foldl (fn (p,i) => (var_names p) @ i) [] ps
	      | ConstructorP(_,p) => var_names p
	      | _                 => []
	fun has_repeats xs =
	    case xs of
		[] => false
	      | x::xs' => List.exists (fn x' => x = x') xs' orelse has_repeats xs'
    in
	(not o has_repeats o var_names) pat
    end;

(* 11 *)

fun match (v : valu, p : pattern) =
    case p of
	Wildcard => SOME []
      | Variable x => SOME [(x,v)]
      | UnitP => (case v of
		      Unit => SOME []
		    | _ => NONE)
      | ConstP x => (case v of
			 Const i => if x = i then SOME [] else NONE
		       | _ => NONE)
      | TupleP ps => (case v of
			  Tuple vs => if List.length ps = List.length vs
				      then all_answers (match) (ListPair.zip (vs,ps))
				      else NONE
			| _ => NONE)
      | ConstructorP (s1,p) => (case v of
				    Constructor (s2,v) => if s1 = s2
							  then match (v,p)
							  else NONE
				  | _ => NONE);

(* 12 *)

fun first_match (v : valu) (ps : pattern list) =
    SOME (first_answer (fn p => (match (v,p))) ps) handle NoAnswer => NONE;
