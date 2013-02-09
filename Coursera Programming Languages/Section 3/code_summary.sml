(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Introduction to First-Class Functions *)

fun double x = 2*x
fun incr x = x+1
val a_tuple = (double, incr, double(incr 7))
val eighteen = (#1 a_tuple) 9

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Functions As Arguments *)

(* it should *pain* us to write the next three functions separately,
   but we do not have to *)
fun increment_n_times_lame (n,x) = (* silly example, this is addition (n+x) *)
   if n=0
   then x
   else 1 + increment_n_times_lame(n-1,x)

fun double_n_times_lame (n,x) = 
   if n=0
   then x
   else 2 * double_n_times_lame(n-1,x)

fun nth_tail_lame (n,xs) =
   if n=0
   then xs
   else tl (nth_tail_lame(n-1,xs))

(* this is much better: as always, abstract the common pieces into a function
   n_times(f,n,x) returns f(f(...(f(x)))) where there are n calls to f
   note: if we gave x type int, then we could not use this for lists
*)
fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

fun increment x = x+1

fun double x = x+x

val x1 = n_times(double,4,7)
val x2 = n_times(increment,4,7)
val x3 = n_times(tl,2,[4,8,12,16]) 

(* and we can define functions that use n_times *)
fun addition (n,x) = n_times(increment,n,x) (* assumes n >=0 *)
fun double_n_times (n,x) = n_times(double,n,x)
fun nth_tail (n,x) = n_times(tl,n,x)

(* we can then use n_times for more things we did not plan on originally *)

fun triple x = 3*x

fun triple_n_times (n,x) = n_times(triple,n,x)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Polymorphic Types and Functions As Arguments *)

(* our n_times function is polymorphic, which lets us use it for numbers, lists,
   or anything else provided f and x "agree"
     - return and argument type of f must be the same here because and only
       because result is passed back to f
*)
fun n_times (f,n,x) = (* ('a -> 'a) * int * 'a -> 'a *)
    if n=0
    then x
    else f (n_times(f,n-1,x))

fun increment x = x+1
fun double x = x+x
val x1 = n_times(double,4,7)       (* instantiates 'a with int *)
val x2 = n_times(increment,4,7)    (* instantiates 'a with int *)
val x3 = n_times(tl,2,[4,8,12,16]) (* instantiates 'a with int list *)

(* higher-order functions are often polymorphic based on "whatever
type of function is passed" but not always: *)
(* note: a better implementation would be tail-recursive *)
fun times_until_zero (f,x) = 
    if x=0 then 0 else 1 + times_until_zero(f, f x)

(* conversely, we have seen polymorphic functions that are not higher-order *)
fun len xs =
    case xs of
       [] => 0
      | x::xs' => 1 + len xs'

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Anonymous Functions *)

fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

fun triple x = 3*x

fun triple_n_times1 (n,x) = n_times(triple,n,x)

fun triple_n_times2 (n,x) =
  let fun triple x = 3*x in n_times(triple,n,x) end

(* actually since used only once, we could define it 
   right where we need it *)
fun triple_n_times3 (n,x) = 
    n_times((let fun triple y = 3*y in triple end), n, x)

(* This does not work: a function /binding/ is not an /expression/ *)
(* fun triple_n_times3 (n,x) = n_times((fun triple y = 3*y), n, x) *)

(* This /anonymous function/ expression works and is the best style: *)
(* Notice the function has no name *)

fun triple_n_times4 (n,x) = n_times((fn y => 3*y), n, x)

(* because triple_n_times4 does not call itself, we could use a val-binding
   to define it, but the fun binding above is better style *)
val triple_n_times5 = fn (n,x) => n_times((fn y => 3*y), n, x)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Unnecessary Function Wrapping *)

fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

(* bad style: the if e then true else false of functions  *)
fun nth_tail (n,xs) = n_times((fn y => tl y), n, xs)

(* good style: *)
fun nth_tail (n,x) = n_times(tl, n, x)

(* bad style *)
fun rev xs = List.rev xs

val rev = fn xs => List.rev xs

(* good style *)
val rev = List.rev

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Map and Filter *)

(* here is a very, very useful and common example *)
fun map (f,xs) =
    case xs of
	[] => []
      | x::xs' => (f x)::(map(f,xs'))

val x1 = map ((fn x => x+1), [4,8,12,16])

val x2 = map (hd, [[1,2],[3,4],[5,6,7]])

(* another very, very useful and common example *)
fun filter (f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x
		  then x::(filter (f,xs'))
		  else filter (f,xs')

fun is_even v = 
    (v mod 2 = 0)

fun all_even xs = 
    filter(is_even,xs)
	
fun all_even_snd xs = 
    filter((fn (_,v) => is_even v), xs)


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Generalizing Prior Topics *)

(* Returning a function *)
fun double_or_triple f =
    if f 7
    then fn x => 2*x
    else fn x => 3*x

val double = double_or_triple (fn x => x-3 = 4)
val nine = (double_or_triple (fn x => x = 42)) 3

(* Higher-order functions over our own datatype bindings *)
datatype exp = Constant of int 
	     | Negate of exp 
	     | Add of exp * exp
	     | Multiply of exp * exp

fun true_of_all_constants(f,e) =
    case e of
	Constant i => f i
      | Negate e1 => true_of_all_constants(f,e1)
      | Add(e1,e2) => true_of_all_constants(f,e1)
		      andalso true_of_all_constants(f,e2)
      | Multiply(e1,e2) => true_of_all_constants(f,e1)
			   andalso true_of_all_constants(f,e2)

fun all_even e = true_of_all_constants((fn x => x mod 2 = 0),e)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Lexical Scope *)

(* 1 *) val x = 1
         (* x maps to 1 *)
(* 2 *) fun f y = x + y
         (* f maps to a function that adds 1 to its argument*)
(* 3 *) val x = 2
         (* x maps to 2 *)
(* 4 *) val y = 3
         (* y maps to 3 *)
(* 5 *) val z = f (x + y) (* call the function defined on
                             line 2 with 5 *)
         (* z maps to 6 *)
(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Lexical Scope and Higher-Order Functions *)

(* first example *)
val x = 1
fun f y = 
    let 
        val x = y+1
    in
        fn z => x + y  + z
    end
val x = 3
val g = f 4 
val y = 5
val z = g 6

(* second example *)
fun f g = 
    let 
        val x = 3
    in
        g 2
    end
val x = 4
fun h y = x + y 
val z = f h

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Why Lexical Scope *)

(* f1 and f2 are always the same, no matter where the result is used *)

fun f1 y =
    let 
	val x = y + 1
    in
	fn z => x + y + z
    end

fun f2 y =
    let 
	val q = y + 1
    in
	fn z => q + y + z
    end

val x = 17 (* irrelevant *)
val a1 = (f1 7) 4
val a2 = (f2 7) 4

(* f3 and f4 are always the same, no matter what argument is passed in *)

fun f3 g =
    let 
	val x = 3 (* irrelevant *)
    in
	g 2
    end

fun f4 g =
    g 2

val x = 17 
val a3 = f3 (fn y => x + y)
val a4 = f3 (fn y => 17 + y)

(* under dynamic scope, the call "g 6" below would try to add a string
(from looking up x) and would have an unbound variable (looking up y),
even though f1 type-checked with type int -> (int -> int) *)

val x = "hi"
val g = f1 7
val z = g 4

(* Being able to pass closures that have free variables (private data)
   makes higher-order functions /much/ more useful *)
fun filter (f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x then x::(filter(f,xs')) else filter(f,xs')

fun greaterThanX x = fn y => y > x

fun noNegatives xs = filter(greaterThanX ~1, xs)

fun allGreater (xs,n) = filter (fn x => x > n, xs)

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Closures and Recomputation *)

fun filter (f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x then x::(filter(f,xs')) else filter(f,xs')

fun allShorterThan1 (xs,s) = 
    filter (fn x => String.size x < (print "!"; String.size s), xs)

fun allShorterThan2 (xs,s) =
    let 
	val i = (print "!"; String.size s)
    in
	filter(fn x => String.size x < i, xs)
    end

val _ = print "\nwithAllShorterThan1: "

val x1 = allShorterThan1(["1","333","22","4444"],"xxx")

val _ = print "\nwithAllShorterThan2: "

val x2 = allShorterThan2(["1","333","22","4444"],"xxx")

val _ = print "\n"

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Fold and More Closures *)

(* Another hall-of-fame higher-order function *)

(* note this is "fold left" if order matters 
   can also do "fold right" *)
fun fold (f,acc,xs) =
    case xs of 
	[] => acc
      | x::xs' => fold (f,f(acc,x),xs')

(* examples not using private data *)

fun f1 xs = fold ((fn (x,y) => x+y), 0, xs)

fun f2 xs = fold ((fn (x,y) => x andalso y >= 0), true, xs)

(* examples using private data *)

fun f3 (xs,lo,hi) = 
    fold ((fn (x,y) => 
	      x + (if y >= lo andalso y <= hi then 1 else 0)),
          0, xs)

fun f4 (xs,s) =
    let 
	val i = String.size s
    in
	fold((fn (x,y) => x andalso String.size y < i), true, xs)
    end

fun f5 (g,xs) = fold((fn(x,y) => x andalso g y), true, xs)

fun f4again (xs,s) =
    let
	val i = String.size s
    in
	f5(fn y => String.size y < i, xs)
    end

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Another Closure Idiom: Combining Functions *)

fun compose (f,g) = fn x => f (g x)

fun sqrt_of_abs i = Math.sqrt(Real.fromInt (abs i))

fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs

(* tells the parser !> is a function that appears between its two arguments *)
infix !> 

(* operator more commonly written |>, but that confuses the current version
   of SML Mode for Emacs, leading to bad editing and formatting *)

(* definition of the pipeline operator *)
fun x !> f = f x

fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt

fun backup1 (f,g) = fn x => case f x of NONE => g x | SOME y => y

fun backup2 (f,g) = fn x => f x handle _ => g x

(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Another Closure Idiom: Currying *)

(* old way to get the effect of multiple arguments *)
fun sorted3_tupled (x,y,z) = z >= y andalso y >= x

val t1 = sorted3_tupled (7,9,11)

(* new way: currying *)
val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

(* alternately: fun sorted3 x = fn y => fn z => z >= y andalso y >= x *)

val t2 = ((sorted3 7) 9) 11

(* syntactic sugar for calling curried functions: optional parentheses *)
val t3 = sorted3 7 9 11 

(* syntactic sugar for defining curried functions: space between arguments *)
fun sorted3_nicer x y z = z >= y andalso y >= x

(* more calls that work: *)
val t4 = sorted3_nicer 7 9 11
val t5 = ((sorted3_nicer 7) 9) 11

(* calls that do not work: cannot mix tupling and currying *)
(*val wrong1 = ((sorted3_tupled 7) 9) 11*)
(*val wrong2 = sorted3_tupled 7 9 11*)
(*val wrong3 = sorted3 (7,9,11)*)
(*val wrong4 = sorted3_nicer (7,9,11)*)

(* a more useful example *)
fun fold f acc xs = (* means fun fold f = fn acc => fn xs => *)
  case xs of
    []     => acc
  | x::xs' => fold f (f(acc,x)) xs'

(* a call to curried fold: will improve this call next *)
fun sum xs = fold (fn (x,y) => x+y) 0 xs


(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Section 3: Partial Application *)

fun sorted3 x y z = z >= y andalso y >= x

fun fold f acc xs = (* means fun fold f = fn acc => fn xs => *)
  case xs of
    []     => acc
  | x::xs' => fold f (f(acc,x)) xs'

(* If a curried function is applied to "too few" arguments, that just returns
   a closure, which is often useful -- a powerful idiom (no new semantics) *)

val is_nonnegative = sorted3 0 0

val sum = fold (fn (x,y) => x+y) 0

(* In fact, not doing this is often a harder-to-notice version of
   unnecessary function wrapping, as in these inferior versions *)

fun is_nonnegative_inferior x = sorted3 0 0 x

fun sum_inferior xs = fold (fn (x,y) => x+y) 0 xs

(* another example *)

fun range i j = if i > j then [] else i :: range (i+1) j

val countup  = range 1

fun countup_inferior x = range 1 x

(* common style is to curry higher-order functions with function arguments
   first to enable convenient partial application *)

fun exists predicate xs =
    case xs of
      [] => false
    | x::xs' => predicate x orelse exists predicate xs'

val no = exists (fn x => x=7) [4,11,23]

val hasZero = exists (fn x => x=0)

val incrementAll = List.map (fn x => x + 1)

(* library functions foldl, List.filter, etc. also generally curried: *)

val removeZeros = List.filter (fn x => x <> 0)

(* but if you get a strange message about "value restriction", just put back
   in the actually-necessary wrapping or an explicit non-polymorphic type *)

(* does not work for reasons we will not explain here (more later) *)
(* (only an issue will polymorphic functions) *)

(* val pairWithOne = List.map (fn x => (x,1)) *)

(* workarounds: *)
fun pairWithOne xs = List.map (fn x => (x,1)) xs

val pairWithOne : string list -> (string * int) list = List.map (fn x => (x,1))

(* this different function works fine because result is not polymorphic *)
val incrementAndPairWithOne = List.map (fn x => (x+1,1))
