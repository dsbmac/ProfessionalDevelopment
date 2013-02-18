val a =  (print "H")

fun foo f x y z = 
	if x >= y
	then (f z)
	else foo f y x (tl z)

fun maybeEven x = 
	if x = 0 
	then true
	else
	if x = 50
	then false
	else maybeOdd (x-1)
and
maybeOdd y =
	if y = 0
	then false
	else 
	if y = 99
	then true
	else maybeEven (y-1)
