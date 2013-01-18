def p3():
    limit = 1000
    fib1 = 1
    fib2 = 1
    count = 3
    fib = 2

    while len(str(fib)) <= limit:

        fib = fib1 + fib2
        fib1 = fib2
        fib2 = fib
        
        print "n: " + str(count) + ", " +  str(len(str(fib))) #+ " fib: " + str(fib) 
        count +=1

p3()
        
