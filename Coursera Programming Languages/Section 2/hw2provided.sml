(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (str, strs) =
    let
	fun all_except_rec (strs) =
	    if strs = []
	    then []
	    else if same_string(str, hd strs)
	    then tl strs 
	    else hd strs::all_except_rec (tl strs)
	val x = all_except_rec(strs)
    in 
	if x = strs
	then NONE
	else SOME (x)
    end

fun get_substitutions1 (sLL, s) =
    if null sLL
    then []
    else
	let 
	    val x = all_except_option(s, hd sLL)
	in 
	    if x = NONE
	    then get_substitutions1(tl sLL, s)
	    else valOf x @ get_substitutions1(tl sLL, s)
	end
(*
fun get_substitutions2 (sLL, s) = 
    let fun aux (sLL, acc) =
	    if sLL = []
	    then acc
	    else  aux(tl sLL, all_except_option(s, hd sLL) @ acc) 
    in aux(sLL, [])
    end


fun similar_names (sLL, fullName) =
    let
	fun f (sL) =
	    if null sL
	    then []
	    else hd sL::f(tl sL)
	val firstNames = get_substitutions1(sLL, #first fullName)
    in
	f(firstNames)
    end
*)
	    
(* you may assume that Num is always used with values 2, 3, ..., 9
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color card =
    case card of
	(Clubs,rank) => Black
      | (Spades,rank) => Black
      | (Hearts,rank) => Red
      | (Diamonds,rank) => Red

fun card_value card = 
    case card of
	(suit,Ace) => 11
     | (suit,King) => 10
     | (suit,Queen) => 10
     | (suit,Jack) => 10		   
     | (suit,i) => i

fun test () =
    let
	val s1 = Clubs
	val r1 = 2
	val c1 = (s1, r1)
    in card_color c1
    end

fun test2 () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
    in card_value c1
    end
