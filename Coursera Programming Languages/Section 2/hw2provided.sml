(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option (x, xs) =
    let fun f (xs) = 
	    case xs of
		[] => []
	      | i::xs' => 
		if same_string(i,x)
		then xs'
		else i::f(xs')
	val rs = f(xs)
    in
	if rs = xs
	then NONE
	else SOME rs
    end

fun get_substitutions1 (sLL, s) =
    case sLL of
	[] => []
     | sL::sLL' => 
       case all_except_option(s,sL) of
	   NONE => get_substitutions1(sLL',s)
	 | SOME xs => xs @ get_substitutions1(sLL',s)

fun get_substitutions2 (sLL, s) = 
    let fun aux (sLL, acc) =
	    case sLL of
		[] => acc
	     | sL::sLL' =>
	       case all_except_option (s,sL) of
		   NONE => aux(sLL',acc)
		 | SOME x => aux(sLL',x @ acc)
    in aux(sLL, [])
    end

fun similar_names (sLL, fullName) =
    let
	val {first=f,middle=m,last=l} = fullName
	val names = get_substitutions2(sLL,f)
	fun aux (ns,acc) =
	    case ns of
		[] => acc
	      | n'::ns' =>aux(ns',{first=n',middle=m,last=l}::acc)
    in
	aux(names,[fullName])
    end
	    
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
     | (suit,Num(x)) => x

exception e

fun remove_card (cs, c, e) =
    let fun f (cs) = 
	    case cs of
		[] => []
	      | i::cs' => 
		if i = c
		then cs'
		else i::f(cs')
	val r = f(cs)
    in
	if r = cs
	then raise e
	else r
    end

fun all_same_color (cs) =
    case cs of
	[] => true
     | _::[] => true
     | c1::(c2::cs') => card_color(c1) =  card_color(c2) andalso all_same_color(cs')


fun sum_cards (cs) =
    let fun f(cs,acc) =
	    case cs of 
		[] => acc
	      | c::cs' => f(cs',acc+card_value(c))
    in 
	f(cs,0)
    end

fun score (cs,goal) =
    let val sum = sum_cards(cs)
	val pScore = if sum > goal
		     then (sum-goal) * 3
		     else goal - sum
    in 
	if all_same_color(cs)
	then pScore div 2
	else pScore
    end	    
(*
fun officiate (cs,ms,goal) =
    let
	fun game (cs,ms,held) =
	    case ms of
		[] => held
	      | m::ms' => 
		case m of
		    Draw => game(tl cs, tl ms, hd cs::held)
		  | Discard card => game(tl cs, tl ms, held)
    in
	let
	    val held' = game(cs,ms,[])
	in
	    score(held',goal)
	end	
    end
*)

fun officiate (cs,ms,goal) =
    let
	exception IllegalMove
	fun game (cs,ms,held) =
	    case ms of
		[] => held
	      | Discard card::ms' => 
		game(cs,ms',remove_card(held,card,IllegalMove))
	      | Draw::ms' => 
		case cs of
		    [] => held
		 | c::cs' => game(cs',ms', c::held)
    in
	score(game(cs,ms,[]),goal)
    end

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

fun test3 () =
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
	val cs = [c1,c2,c3]
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
