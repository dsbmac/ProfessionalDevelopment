fun full_name {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z

val name = {first="D", middle="sek", last="Macho"}

val b = full_name(name)

fun incr x = x+1

val incr2 = 1

fun sorted3 x y z = z >= y andalso y >= x

val is_nonnegative = sorted3 0 0
