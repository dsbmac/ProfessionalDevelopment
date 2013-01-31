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

fun test_card_color () =
    let 
	val s1 = Clubs
	val r1 = 2
	val c1 = (s1, r1)
    in card_color c1 = Black
    end

fun test_card_value () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
    in card_value c1 = 11
    end

fun test_remove_card () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
	val s2 = Hearts
	val r2 = Queen
	val c2 = (s2, r2)
	val s3 = Diamonds
	val r3 = Num 2
	val c3 = (s3, r3)
	val cs = [c3,c1,c2,c3]
	exception e
    in
	remove_card (cs,c3,e)
    end

fun test2_remove_card () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
	val cs = []
	exception e
    in
	remove_card (cs,c1,e)
    end
(*
fun test3_remove_card () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	exception IllegalMove
    in
	remove_card (cards,(Hearts,Jack),IllegalMove)
    end
*)
fun test4_remove_card () =
    let
	val c1 = (Clubs, Ace)
	val c2 = (Hearts, Queen)
	val c3 = (Diamonds, Num 2)
	val cs = [c1,c2,c3]
	exception e
    in
	remove_card (cs,c3,e)
    end

fun test4 () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
	val s2 = Spades
	val r2 = Queen
	val c2 = (s2, r2)
	val s3 = Clubs
	val r3 = Num 2
	val c3 = (s3, r3)
	val cs = [c1,c2,c3]
    in
	all_same_color (cs)
    end

fun test5 () =
    let
	val s1 = Clubs
	val r1 = Ace
	val c1 = (s1, r1)
	val s2 = Spades
	val r2 = Queen
	val c2 = (s2, r2)
	val s3 = Clubs
	val r3 = Num 2
	val c3 = (s3, r3)
	val cs = [c1,c2,c3]
    in
	sum_cards (cs)
    end

fun test6 () =
    let
	val s1 = Clubs
	val r1 = King
	val c1 = (s1, r1)
	val s2 = Spades
	val r2 = Queen
	val c2 = (s2, r2)
	val s3 = Clubs
	val r3 = Num 10
	val c3 = (s3, r3)
	val cs = [c1,c2,c3]
    in
	score (cs, 10)
    end

fun test7 () =
    let
	val s1 = Clubs
	val r1 = King
	val c1 = (s1, r1)
	val s2 = Spades
	val r2 = Queen
	val c2 = (s2, r2)
	val s3 = Clubs
	val r3 = Num 10
	val c3 = (s3, r3)
	val cs = [c1,c2,c3]
	val m1 = Draw
	val m2 = Draw
	val m3 = Draw
	val ms = [m1,m2,m3]
	val goal = 10
    in
	officiate(cs,ms,goal)
    end

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
 	officiate(cards,moves,22)
    end

fun provided_test3 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
	val moves = [Discard(Hearts,Jack)]
    in
	officiate(cards,moves,42)
    end

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
val q02a_test = 
    test_card_color()
val q02b_test = 
    test_card_value()
val q02c_test = 
    test_remove_card()
val q02g_test = 
    provided_test2()

val all_tests = 
    q01a_test andalso q01b_test andalso q01c_test andalso q01d_test
