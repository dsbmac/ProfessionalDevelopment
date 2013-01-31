(* Dan Grossman, Coursera PL, HW2 Provided Tests *)

(* These are just two tests for problem 2; you will want more.

   Naturally these tests and your tests will use bindings defined 
   in your solution, in particular the officiate function, 
   so they will not type-check if officiate is not defined.
 *)

use "hw2provided.sml";

val test_all_except_option = 
    let
	val a = "Money"
	val b = "Changes"
	val c = "Everything"
	val strs = [a,b,c]	
	val expected = true	    
    in
	[all_except_option(a, strs), all_except_option("Donkey", strs)]
    end

val test_get_substitutions1 =
    get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred")

val test_get_substitutions1' =
    get_substitutions1([],"Fred")

val test_get_substitutions2 =
    get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred")

val test_similar_names =
    similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"})

val q01a_test = 
    test_all_except_option = [SOME ["Changes","Everything"],NONE]
val q01b_test = 
    test_get_substitutions1 = ["Fredrick","Freddie","F"] andalso test_get_substitutions1' = []
val q01c_test = 
    test_get_substitutions2 = ["Fredrick","Freddie","F"]
val q01d_test =
    test_similar_names = [{first="Fredrick",last="Smith",middle="W"},
   {first="F",last="Smith",middle="W"},
   {first="Freddie",last="Smith",middle="W"},
   {first="Fred",last="Smith",middle="W"}]

fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	val moves = [Draw,Discard(Hearts,Jack)]
    in
	officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 3 *)
    let val cards = [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)]
	val moves = [Draw,Draw,Draw,Draw,Draw]
    in
 	officiate(cards,moves,42) = 3
    end

val all_tests = 
    q01a_test andalso q01b_test andalso q01c_test andalso q01d_test andalso provided_test2()
