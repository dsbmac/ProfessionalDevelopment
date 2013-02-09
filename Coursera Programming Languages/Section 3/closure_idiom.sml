fun compose(f,g) = fn x => f(g,x)
 
fun sqrt_of_abs i = (Math.sqrt(Real.fromInt(abs i))

fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i

fun sqrt_of_abs i = Math.sqrt o Real.fromInt o abs
