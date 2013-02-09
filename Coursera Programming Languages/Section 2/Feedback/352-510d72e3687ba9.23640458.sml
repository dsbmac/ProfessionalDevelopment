(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
(* 1a *)
fun all_except_option (s, []) = NONE
  | all_except_option (s, x::xs) = if same_string (s, x) 
				   then SOME xs (* no repitition, so done *)
				   else case all_except_option (s, xs) of
					    NONE => NONE
					  | SOME xs' => SOME (x::xs')
(* 1b *)
fun get_substitutions1 ([], s) = []
  | get_substitutions1 (xs::xss, s) = case all_except_option(s, xs) of
				       NONE => get_substitutions1(xss, s)
				    |  SOME xs' => xs' @ get_substitutions1(xss, s)

    
(* 1c *)
fun get_substitutions2 (xss, s) = 
    let fun loop (acc, yss) =
	   case yss of
	       [] => acc
	     | zs::zss => case all_except_option(s, zs) of
			       NONE => loop(acc, zss)
			     | SOME xs => loop(acc @ xs, zss)
			  
    in
	loop([], xss)
    end

(* 1d *)
fun similar_names ([], x) = [x]
  | similar_names (xs::xss, {first=f, middle=m, last=l}) = 
    let fun vary_first_name [] = []
	  (* f' instead of f, to avoid confusion because of shadowing, even though it would still work *)
	  | vary_first_name (f'::fs) = 
	     {first=f', middle=m, last=l} :: vary_first_name(fs)
    in
	case all_except_option(f, xs) of
	    NONE => similar_names(xss, {first=f, middle=m, last=l})
	  | SOME fs => {first=f, middle=m, last=l} :: vary_first_name(fs)
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
	    
(* 2a *)
fun card_color (Clubs, _) = Black
  | card_color (Spades, _) = Black
  | card_color (Diamonds, _) = Red
  | card_color (Hearts, _) = Red

(* 2b *)
fun card_value (_, Num n) = n
  | card_value (_, Ace) = 11
  | card_value  _ = 10

(* 2c *)
fun remove_card ([], c, e) = raise e
  | remove_card (x::xs, c, e) = if x = c then xs else x::remove_card(xs, c, e)

(* 2d *)
fun all_same_color [] = true
  | all_same_color [x] = true
  | all_same_color (x::y::rest) = card_color x = card_color y andalso all_same_color(y::rest)

(* 2e *)
fun sum_cards cards = 
    let fun loop (acc, []) = acc
	  | loop (acc, c::cs) =
            loop(acc + card_value c, cs)
    in
	loop(0, cards)
    end

(* 2f *)
fun score (cards, goal) =
    let val sum = sum_cards cards
	val ps = if sum > goal 
		 then 3 * (sum - goal) 
		 else goal - sum
    in
	if all_same_color cards then ps div 2 else ps
    end

(* 2g *)
fun officiate (cards, moves, goal) =
    let fun next(held, cards, moves) =
	    case moves of
		[] => score(held, goal)
	      | Draw :: rem_moves => (case cards of
					  [] => score(held, goal)
					| card :: rem_cards => if sum_cards held >= goal
							       then score (held, goal)
							       else next(card::held, rem_cards, rem_moves))
	      | Discard card :: rem_moves  => next(remove_card (held, card, IllegalMove), cards, rem_moves)
    in
	next([], cards, moves)
    end
