fun sum1 xs =
    case xs of
	[] => 0
     | i::xs'  => i + sum1 xs'

fun sumMine xs =
    if null xs
    then 0
    else hd xs + sumMine(tl xs)

fun test_sum () =
	let 
	    val xs = [1,1,2]
	in 
	    [sum1(xs), sumMine(xs)]
	end

