fun fold (f, acc, xs) =
    case xs of
	[] => acc
     | x::xs' => fold(f,f(acc,x),xs')

fun f1 xs = fold((fn (x,y) => x+y), 0, xs) 

fun f2 xs = fold((fn (x,y) => x andalso y >= 0), true,xs)

fun test1() =
    let
	val a = 1
	val b = 0
	val c = 3
	val xs = [a,b,c]
    in 
	f1 xs
    end

fun test2() =
    let
	val a = 1
	val b = ~2
	val c = 3
	val xs = [a,b,c]
    in 
	f2 xs
    end
