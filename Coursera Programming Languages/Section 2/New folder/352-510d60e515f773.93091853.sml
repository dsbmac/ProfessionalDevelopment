(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* a *)
fun all_except_option(str, strList)=
    case strList of
	[] => NONE
	| sHead::sTail => let val others = all_except_option(str, sTail)
			  in if same_string(str, sHead)
			     then case others of
				   NONE => SOME(sTail)
				   | tail => tail 
			     else case others of
				   SOME tail => SOME(sHead::tail)
				   | _ => NONE 
			  end

(* b *)
fun get_substitutions1(subs : string list list, s : string)=
    case subs of
	[] => []
      | subsHd::subsTl => let val allExcept = all_except_option(s, subsHd)
		    in
			case allExcept of
			    SOME h => h @ get_substitutions1(subsTl, s)
			  | _ => get_substitutions1(subsTl, s)
		    end

(* c *)
fun get_substitutions2(subs : string list list, s : string)=
    let
	fun get_subs(result : string list, currentSub : string list list)=
	    case currentSub of
		[] => result
		|  subsHd::subsTl => let val allExcept = all_except_option(s, subsHd)
				     in
					 case allExcept of
					     SOME h => get_subs(result @ h, subsTl)
					  | _ => get_subs(result, subsTl)
				     end
    in
	get_subs([], subs)
    end

(* d *)
type fullNameRecord = { first : string,
			middle : string,
			last : string}

fun similar_names(subs : string list list, fullName : fullNameRecord)=
    let
	fun toRecords(firstNames : string list, middle : string, last : string) =
	    case firstNames of
		[]=>[]
	      | hd::tl => {first=hd, middle=middle, last=last}::toRecords(tl, middle, last) 
    in
	case fullName of
	    {first = f, middle = m, last = l} => fullName :: toRecords(get_substitutions1(subs, f), m, l)
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
(* 2a *)
fun card_color(c : card)=
    case c of
	(Spades,_) => Black
      | (Clubs, _) => Black
      | _ => Red

(* 2b *)
fun card_value(c : card)=
    case c of
	(_, Num n) => n
      | (_, Ace) => 11
      | _ => 10

(* 2c *)
fun remove_card(cs : card list, c : card, e)=
    let
	fun remove_internal(cs_internal : card list, removed_times : int)=
	    case cs_internal of
		[] => if removed_times < 1 then raise e else []
	      | hd::tl =>
		if hd = c andalso removed_times < 1 then
		    remove_internal(tl, removed_times + 1)
		else hd::remove_internal(tl, removed_times)
    in
	remove_internal(cs, 0)
    end
    
(* 2d *)
fun all_same_color(cards : card list) =
    case cards of
	[] => true
      | hd::[] => true
      | hd1::hd2::tl => card_color(hd1)=card_color(hd2) andalso all_same_color(hd2::tl)  
    

(* 2e *)
fun sum_cards(cards : card list)=
    let
	fun sum_internal(cc : card list, sum : int)=
	    case cc of
		[] => sum
	      | hd::tl => sum_internal(tl, sum + card_value(hd)) 
    in
	sum_internal(cards, 0)
    end

(* 2f *)
fun score(cards : card list, goal : int)=
    let
	val sum = sum_cards(cards)
	val preScore = if sum > goal then (3 * (sum-goal)) else (goal - sum)
    in
	if all_same_color(cards)=true
	then preScore div 2
	else preScore
    end

(* 2g 
fun officiate(allCards : card list, allMoves : move list, goal : int) =
    let
	fun state(cardsInHand : card list, cardsInDeck : card list, moves : move list) =
	    let
		val currentScore = score(cardsInHand, goal)
	    in
		if sum_cards(cardsInHand) > goal
		then currentScore
		else
		    case moves of 
			[] => currentScore
		      | move:tlMoves =>
			case cardsInDeck of
			    currentCard::tlCardsInDeck => 
			    case move of
				Discard => currentState(remove_card(cardsInHand, ), cardsInDeck, tlMoves)
			  | Draw => case cards of
				[] => 0
			      | _  =>  score(cards, goal)
	    end  
    in
	state([], allCards, allMoves)
    end
    
*)
