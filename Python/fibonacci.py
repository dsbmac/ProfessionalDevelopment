def fib(n):
	memoize = {}

	def recfib(n):
		if n in memoize: return memoize[n]
		elif n == 0: return 0
		elif n == 1: return 1
		else:
			f = recfib(n-1) + recfib(n-2)
			memoize[n] = f
			return f

	return recfib(n)

print fib(20 )
