def p3():
    limit = 4000000
    fib1 = 1
    fib2 = 1
    fib = 1
    result = 0
    while fib < limit:        
        if fib % 2 == 0:
            result += fib
            #print "sum: " + str(result)
        fib = fib1 + fib2
        #print fib
        fib1 = fib2
        fib2 = fib

    return result

print p3()
        
