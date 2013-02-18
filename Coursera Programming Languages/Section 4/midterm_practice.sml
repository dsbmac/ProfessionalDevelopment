fun foo f x y z = 
	if x >= y
	then (f z)
	else foo f y x (tl z)

