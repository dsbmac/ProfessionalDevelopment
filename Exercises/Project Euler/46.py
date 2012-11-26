def is_prime(x):
    if x == 2:
        return True

    if x <= 1 or x % 2 == 0:
        return False
    
    for i in range(3,int(x**0.5) + 1, 2):
        if x % i == 0:
            return False
        
    return True

def create_list_of_primes(x, y):
    result = []
    for i in range(1,int(x**0.5) + 1):
        if is_prime(i):
            result.append(i)
    return result

def p3():
    x = 600851475143
    #p_list = prime_list(1,int(x**0.5)+1)
    
    i = int(x**0.5)
    if i % 2 == 0:
        i +=1
        
    while i > 0:
    if x % i == 0 and is_prime(i):
            return i
        i -=2

def is_goldbach(value):
    while total != x:
        for x in prime_list:
            if x.value > value:
                print "i found it!"
                break

def p4():
    create list of primes (start at 35)
##    while loop through odd nums
##        determine if a number is composite odd
##            if not in prime list and is odd then it is
##                test goldbach
##                    loop
##                    find a prime lower than x
##                    loop
##                    add twice a squared num til over
##                    
##                loop find factor
                

    

    
print p3()
