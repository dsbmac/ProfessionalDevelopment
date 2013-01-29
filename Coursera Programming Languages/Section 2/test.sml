	    
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

fun test () =
    let
	val c1 = (Spades, Ace)
    in card_color c1
    end

