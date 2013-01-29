fun full_name {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z

val name = {first="D", middle="sek", last="Macho"}

val b = full_name(name)
