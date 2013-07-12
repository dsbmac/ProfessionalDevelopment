def genPrimes():
    primes = []
    next = 2
    while(True):
        for p in primes:
            if next % p == 0: break
        else:
            primes.append(next)
            yield next
        next +=1
