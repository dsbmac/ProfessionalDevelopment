def genPrime():
    primes = []
    next = 2
    while(True):
        prime = True
        for p in primes:
            if next % p == 0: 
                prime = False
                break
        if prime:
            primes.append(next)
            yield next
        next +=1
def test():
    prime = genPrime()
    prime
    prime.next()

test()
