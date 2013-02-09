(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option(_, []) = NONE
  | all_except_option(s, h::t) =
      case (same_string(s,h), all_except_option(s,t)) of
	 (true, _) => SOME t
       | (false, NONE) => NONE
       | (false, SOME y) => SOME (h::y) 

fun get_substitutions1([],_) = []
  | get_substitutions1(h::t, s) = 
    case all_except_option(s,h) of
	NONE => get_substitutions1(t,s)
      | SOME y => y @ get_substitutions1(t,s)

fun get_substitutions2(sll, s) =
  let fun get_sub2'(sll, ret) =
      case sll of
	[] => ret
       | h::t => case all_except_option(s,h) of
		     NONE => get_sub2'(t, ret)
	           | SOME y => get_sub2'(t, ret @ y)
  in
      get_sub2'(sll, [])
  end

fun similar_names(sll, fullname) =
    let
	val {first=first,middle=middle,last=last} = fullname
	fun buildlist([]) = []
	  | buildlist(h::t) =
	      {first=h, middle=middle, last=last} :: buildlist(t)
    in
	fullname::buildlist(get_substitutions2(sll, first))
    end 


(* You may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color(c) =
    case c of
	(Clubs,_) => Black
     | (Spades,_) => Black
     | _ => Red  

fun card_value(c) =
    case c of
	(_, Num x) => x
     |  (_, Ace) => 11
     |  (_,_) => 10

fun remove_card(cs, c, e) =
    let
	fun remove_card' ([]) = NONE
	  | remove_card' (c1::cs') =
	    case (c1 = c, remove_card'(cs')) of
		  (true, _) => SOME cs'
        	| (false, NONE) => NONE
		| (false, SOME y) => SOME(c1::y)  
    in
	case (remove_card'(cs)) of
	    NONE => raise e
	 |  SOME remaining => remaining
    end

fun all_same_color(cs) =
    case cs of
	[] => true
     | _::[] => true
     | (c1::(c2::rest)) => ( card_color(c1) = card_color(c2) andalso all_same_color(c2::rest) )
  
fun sum_cards(cs) =
    let
	fun sum_cards'(cs,total) =
	    case cs of
		[] => total
	     | (c1::rest) => sum_cards'(rest, total + card_value(c1))
    in
	sum_cards'(cs,0)
    end

fun score(held, goal) =
    let
	val sum = sum_cards(held)
	val pscore = if (sum > goal) then 3 * (sum - goal) else goal - sum
    in
	if (all_same_color(held)) then pscore div 2 else pscore
    end

fun officiate(deck, moves, goal) =
    let
	fun play(held, _, []) = held
	  | play(held, deck', (Discard c)::moves') = play( remove_card(held, c, IllegalMove), deck', moves' )
	  | play(held, [], (Draw)::moves') = held
	  | play(held, c::deck', (Draw)::moves') = if ( sum_cards(c::held) > goal ) then c::held else play (c::held, deck', moves')
    in
	score(play([], deck, moves), goal)
    end  
	    
fun score_challenge(held, goal) =
    let
	fun score_challenge'([], others) = score(others, goal)
	  | score_challenge'((suit,Ace)::held', others) =
	       Int.min( score_challenge'(held', ((suit,Ace)::others)),
                        score_challenge'(held', ((suit,Num 1)::others)) )
	  | score_challenge'(c::held', others) = score_challenge'(held', c::others) 
    in
	score_challenge'(held, [])
    end

fun officiate_challenge(deck, moves, goal) =
    let
	fun play(held, _, []) = held
	  | play(held, [], (Draw)::moves') = held
	  | play(held, deck', (Discard c)::moves') = 
               play(remove_card(held, c, IllegalMove), deck', moves')
	  | play(held, (suit,Ace)::deck', (Draw)::moves') =
               let
                 val p1 = play(held, (suit,Num 1)::deck', (Draw)::moves')
		 val p2 = play(held, (suit,Num 11)::deck', (Draw)::moves')
	       in
		   if score(p1,goal) < score(p2,goal) then p1 else p2
	       end
	  | play(held, c::deck', (Draw)::moves') = 
               if ( sum_cards(c::held) > goal ) 
               then c::held 
               else play (c::held, deck', moves')
    in
	score(play([], deck, moves), goal)
    end  

fun careful_player(deck, goal) =
    let
	fun move'(_, [], moves) = moves
	  | move'(held, c::deck', moves) =
	      let
		val s = score(held, goal)
		val more = goal - sum_cards(held) > 10
	      in
		case (s = 0, more) of
                    (true, _) => moves
		  | (false, true) => move'(c::held, deck', moves @ [Draw])
		  | (_,_) => 
                      let
		        fun try_lookahead([], _) = moves
		  	  | try_lookahead(discard::held, held') =
			    if score(held @ held', goal) = 0 
                            then moves @ [Discard discard, Draw] 
                            else try_lookahead(held, discard::held')
		        in
			  try_lookahead(held, c::[])
		        end
	      end
    in
	move'([], deck, [])
    end
