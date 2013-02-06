fun map(f,xs) =
    case xs of
	[] => []
     |  x::xs' => f( x)::map(f,xs')

val x2 = map(hd, [[1,2],[3,4],[5,6,7]])

fun filter(f,xs) =
    case xs of
	[] => []
     | x::xs'  => if f x
		  then x::(filter (f,xs'))
		  else filter(f,xs')

fun is_even v =
    (v mod 2 = 0)

fun all_even_snd xs = filter((fn (_,v) => is_even v), xs)

