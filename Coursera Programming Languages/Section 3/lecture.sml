fun f1 xs =
    foldl (fn (x,y) => x+y) 0 xs

val xs = [1,1,1,1,1]

val longest_string_helper = fn (x,y) => if x > y then true else false

fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

val triple_n_times5 = fn (n,x) => n_times((fn y => 3*y), n, x)
