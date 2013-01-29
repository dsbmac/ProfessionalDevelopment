(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Records *)

val x = {bar = (1+2,true andalso true), foo = 3+4, baz = (false,9) }

val my_niece = {name = "Amelia", id = 41123 - 12}

val brain_part = {id = true, ego = false, superego = false}

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Tuples as Syntactic Sugar *)

(* records are like tuples with user-defined field names
   conversely, tuples are just records with names 1, 2, ..., n
   the only real difference is "by position" vs. "by name"
*)
val a_pair = (3+1,4+2)
val a_record = {second=4+2, first=3+1}

(* actually, tuples *are* just records with names 1, 2, ..., n and
special "by position" syntax -- our first example of "syntactic sugar" *)
val another_pair = {2=5, 1=6}
val sum = #1 a_pair + #2 another_pair

val x = {3="hi", 1=true};
val y = {3="hi", 2=3+2, 1=true};

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Datatype Bindings *)

datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1+2,3+4)
val e = a

(* Do _not_ redo datatype bindings (e.g., via use "filename.sml".
   Doing so will shadow the type name and the constructors.) 
datatype mytype = TwoInts of int * int | Str of string | Pizza *)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Case Expressions *)

datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

fun f x = 
    case x of 
	Pizza => 3 
      | Str s => 8
      | TwoInts(i1,i2) => i1 + i2

(*    | Pizza => 4; (* redundant case: error *) *)
(*fun g x = case x of Pizza => 3 (* missing cases: warning *) *)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Useful Datatypes *)

datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Num of int

datatype id = StudentNum of int 
            | Name of string * (string option) * string

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

fun eval e =
    case e of
        Constant i => i
      | Negate e2  => ~ (eval e2)
      | Add(e1,e2) => (eval e1) + (eval e2)
      | Multiply(e1,e2) => (eval e1) * (eval e2)

fun number_of_adds e =
    case e of
        Constant i      => 0
      | Negate e2       => number_of_adds e2
      | Add(e1,e2)      => 1 + number_of_adds e1 + number_of_adds e2
      | Multiply(e1,e2) => number_of_adds e1 + number_of_adds e2

val example_exp = Add (Constant 19, Negate (Constant 4))

val example_ans = eval example_exp

val example_addcount = number_of_adds (Multiply(example_exp,example_exp))

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Another Expression Example *)

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

(* Note: example as explained in video assumes there is no library function
   for max of two ints.  There is: Int.max *)

fun max_constant e =
    let fun max_of_two (e1,e2) =
	    let val m1 = max_constant e1
		val m2 = max_constant e2
	    in 
		if m1 > m2 then m1 else m2 
	    end
    in
	case e of
	    Constant i      => i
	  | Negate e2       => max_constant e2
	  | Add(e1,e2)      => max_of_two(e1,e2)
	  | Multiply(e1,e2) => max_of_two(e1,e2)
    end

val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp

(* Note: Using Int.max, we don't need a local helper function. 
This second version is fewer lines, but there is a bit more
code copying. *)

fun max_constant2 e =
    case e of
	Constant i      => i
      | Negate e2       => max_constant2 e2
      | Add(e1,e2)      => Int.max(max_constant2 e1, max_constant2 e2)
      | Multiply(e1,e2) => Int.max(max_constant2 e1, max_constant2 e2)


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Type Synonyms *)

datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Num of int

type card = suit * rank

type name_record = { student_num : int option, 
                     first       : string, 
                     middle      : string option, 
                     last        : string }

fun is_Queen_of_Spades (c : card) = 
    #1 c = Spade andalso #2 c = Queen

val c1 : card = (Diamond,Ace)
val c2 : suit * rank = (Heart,Ace)
val c3 = (Spade,Ace)

(* can call is_Queen_of_Spades with any of c1, c2, c3 *)

(* and once we learn more pattern-matching, we can leave the type off
   function arguments too -- here is a teaser we cannot explain quite yet *)
fun is_Queen_of_Spades2 c =
    case c of
	(Spade,Queen) => true
      | _ => false


(* REPL prints 
  val is_Queen_of_Spades2 = fn : suit * rank -> bool
but that is also
  val is_Queen_of_Spades2 = fn : card -> bool
*)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Lists and Options are Datatypes *)

datatype my_int_list = Empty 
                     | Cons of int * my_int_list
					 
val one_two_three = Cons(1,Cons(2,Cons(3,Empty)))

fun append_mylist (xs,ys) = 
    case xs of
        Empty => ys
      | Cons(x,xs') => Cons(x, append_mylist(xs',ys))

fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i+1

fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs'

fun append (xs,ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs',ys)


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Polymorphic Datatypes *)

(* type is int list -> int *)
fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs'

(* type is 'a list * 'a list -> 'a list *)
fun append (xs,ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs',ys)

(* this really is /exactly/ how options are defined 
   careful: now shadowing the built in ones!
*)

datatype 'a option = NONE | SOME of 'a

(* similarly, here are polymorphic lists but without special syntax *)

datatype 'a mylist = Empty | Cons of 'a * 'a mylist

(* a fancier example for binary trees where internal nodes have data of
   any one type and leaves have data of another possibly-different type *)

datatype ('a,'b) tree = Node of 'a * ('a,'b) tree * ('a,'b) tree
		      | Leaf of 'b

(* type is (int,int) tree -> int *)
fun sum_tree tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => i + sum_tree lft + sum_tree rgt

(* type is ('a,int) tree -> int *)
fun sum_leaves tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => sum_leaves lft + sum_leaves rgt

(* type is ('a,'b) tree -> int *)
fun num_leaves tr =
    case tr of
	Leaf i => 1
     | Node(i,lft,rgt) => num_leaves lft + num_leaves rgt

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Pattern-Matching for Each-Of Types: 
              The Truth About Function Arguments *)

fun sum_triple1 (triple : int * int * int) =
    case triple of
      (x,y,z) => z + y + x

fun full_name1 (r : {first:string,middle:string,last:string}) =
    case r of 
        {first=x,middle=y,last=z} => x ^ " " ^ y ^ " " ^z

fun full_name2 (r : {first:string,middle:string,last:string}) =
    let val {first=x,middle=y,last=z} = r
    in
	x ^ " " ^ y ^ " " ^z
    end

fun sum_triple2 triple =
    let val (x,y,z) = triple 
    in 
        x + y + z 
    end

fun full_name3 {first=x,middle=y,last=z} =
    x ^ " " ^ y ^ " " ^z

fun sum_triple3 (x,y,z) =
    x + y + z

fun rotate_left (x,y,z) = (y,z,x)

fun rotate_right triple = rotate_left(rotate_left triple)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Pattern-Matching for Each-Of Types: 
              The Truth About Function Arguments *)

fun sum_triple1 (triple : int * int * int) =
    case triple of
      (x,y,z) => z + y + x

fun full_name1 (r : {first:string,middle:string,last:string}) =
    case r of 
        {first=x,middle=y,last=z} => x ^ " " ^ y ^ " " ^z

fun full_name2 (r : {first:string,middle:string,last:string}) =
    let val {first=x,middle=y,last=z} = r
    in
	x ^ " " ^ y ^ " " ^z
    end

fun sum_triple2 triple =
    let val (x,y,z) = triple 
    in 
        x + y + z 
    end

fun full_name3 {first=x,middle=y,last=z} =
    x ^ " " ^ y ^ " " ^z

fun sum_triple3 (x,y,z) =
    x + y + z

fun rotate_left (x,y,z) = (y,z,x)

fun rotate_right triple = rotate_left(rotate_left triple)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: A Little Type Inference *)

fun sum_triple1 (x, y, z) =
    x + y + z

fun full_name1 {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z

(* these versions will not type-check without type annotations because
   the type-checker cannot figure out if there might be other fields *)
fun sum_triple2 (triple : int*int*int) =
	   #1 triple + #2 triple + #3 triple

fun full_name2 (r : {first:string, middle:string,
                    last:string}) =
      #first r ^ " " ^ #middle r ^ " " ^ #last r

(* these functions are polymorphic: type of y can be anything *)

fun partial_sum (x, y, z) = 
    x + z

fun partial_name {first=x, middle=y, last=z} =
    x ^ " " ^ z

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Polymorphic Types and Equality Types *)

fun append (xs,ys) =
   case xs of
       [] => ys
     | x::xs' => x :: append(xs',ys)

val ok1 = append(["hi","bye"],["programming","languages"])

val ok2 = append([1,2],[4,5]);

(*
val not_ok = append([1,2],["programming","languages"])
*)

(* has type ''a * ''a -> string *)
fun same_thing(x,y) = if x=y then "yes" else "no" 

(* has type int -> string *)
fun is_three x = if x=3 then "yes" else "no" 

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Nested Patterns *)

exception ListLengthMismatch

(* don't do this *)
fun old_zip3 (l1,l2,l3) = 
    if null l1 andalso null l2 andalso null l3
    then []
    else if null l1 orelse null l2 orelse null l3
    then raise ListLengthMismatch
    else (hd l1, hd l2, hd l3) :: old_zip3(tl l1, tl l2, tl l3)

(* don't do this *)
fun shallow_zip3 (l1,l2,l3) =
    case l1 of
	[] => 
	(case l2 of 
	     [] => (case l3 of
			[] => []
		      | _ => raise ListLengthMismatch)
	   | _ => raise ListLengthMismatch)
      | hd1::tl1 => 
	(case l2 of
	     [] => raise ListLengthMismatch
	   | hd2::tl2 => (case l3 of
			      [] => raise ListLengthMismatch
			    | hd3::tl3 => 
			      (hd1,hd2,hd3)::shallow_zip3(tl1,tl2,tl3)))

(* do this *)
fun zip3 list_triple =
    case list_triple of 
	([],[],[]) => []
      | (hd1::tl1,hd2::tl2,hd3::tl3) => (hd1,hd2,hd3)::zip3(tl1,tl2,tl3)
      | _ => raise ListLengthMismatch

(* and the inverse *)
fun unzip3 lst =
    case lst of
	[] => ([],[],[])
      | (a,b,c)::tl => let val (l1,l2,l3) = unzip3 tl
		       in
			   (a::l1,b::l2,c::l3)
		       end

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: More Nested Patterns *)

(* another elegant use of "deep" patterns *)
fun nondecreasing xs =
    case xs of
	[] => true
      | x::[] => true
      | head::(neck::rest) => (head <= neck andalso nondecreasing (neck::rest))

(* nested pattern-matching often convenient even without recursion;
   also the wildcard pattern is good style 
   match on a pair and one or more parts of it quite useful on homework 2
*)
datatype sgn = P | N | Z

fun multsign (x1,x2) = 
  let fun sign x = if x=0 then Z else if x>0 then P else N 
  in
      case (sign x1,sign x2) of
	  (Z,_) => Z
	| (_,Z) => Z
	| (P,P) => P
	| (N,N) => P
	| _     => N (* many say bad style; I am okay with it *)
  end

(* simpler use of wildcard pattern for when you do not need the data *)

fun len xs =
    case xs of
       [] => 0
      | _::xs' => 1 + len xs'

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: *Optional*: Function Patterns *)

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

fun old_eval e =
    case e of
        Constant i => i
      | Negate e2  => ~ (old_eval e2)
      | Add(e1,e2) => (old_eval e1) + (old_eval e2)
      | Multiply(e1,e2) => (old_eval e1) * (old_eval e2)

fun eval (Constant i) = i
  | eval (Negate e2) = ~ (eval e2)
  | eval (Add(e1,e2)) = (eval e1) + (eval e2)
  | eval (Multiply(e1,e2)) = (eval e1) * (eval e2)

fun append ([],ys) = ys
  | append (x::xs',ys) = x :: append(xs',ys)


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Exceptions *)

fun hd xs =
    case xs of
        []   => raise List.Empty
      | x::_ => x

exception MyUndesirableCondition

exception MyOtherException of int * int

fun mydiv (x,y) =
    if y=0
    then raise MyUndesirableCondition
    else x div y 

fun maxlist (xs,ex) = (* int list * exn -> int *)
    case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x,maxlist(xs',ex))

val w = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)

val x = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)
	handle MyUndesirableCondition => 42

(*val y = maxlist ([],MyUndesirableCondition)*)

val z = maxlist ([],MyUndesirableCondition) (* 42 *)
	handle MyUndesirableCondition => 42

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Tail Recursion *)

fun fact1 n = if n=0 then 1 else n * fact1(n-1)

fun fact2 n =
    let fun aux(n,acc) = if n=0 then acc else aux(n-1,acc*n)
    in
        aux(n,1)
    end


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 2: Accumulators *)

fun sum1 xs =
    case xs of
        [] => 0
      | i::xs' => i + sum1 xs'

fun sum2 xs =
    let fun f (xs,acc) =
            case xs of
                [] => acc
              | i::xs' => f(xs',i+acc)
    in
        f(xs,0)
    end

fun rev1 xs =
   case xs of
       [] => []
     | x::xs' => (rev1 xs') @ [x]

fun rev2 xs =
    let fun aux(xs,acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', x::acc)
    in
        aux(xs,[])
    end
