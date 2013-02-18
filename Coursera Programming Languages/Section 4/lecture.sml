signature MATHLIB =
sig
val fact : int -> int
val half_pi : real
(* val doubler : int -> int *)
end

structure MyMathLib :> MATHLIB =
struct
fun fact x =
    if x=0
    then 1
    else x * fact (x-1)

val half_pi = Math.pi / 2.0

fun doubler y = y + y
end

val pi =  MyMathLib.half_pi + MyMathLib.half_pi

