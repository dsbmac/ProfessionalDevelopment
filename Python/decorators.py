def identity_decorator(func):
	def wrapper():
		func()
	return wrapper

def a_function():
	print "I'm a normal function."

a_function()