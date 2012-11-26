def is_prime(x):
    if x == 2:
        return True

    if x <= 1 or x % 2 == 0:
        return False
    
    for i in range(3,int(x**0.5) + 1, 2):
        if x % i == 0:
            return False
        
    return True

def prime_list(x, y):
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


def p4():
    #while loop to search for primes
    #put prime into list
    check if it has prime factors
        find one prime factor
            check if it is the unique list
                if not
                    store it in unique list
                    search for next factor of the number
            
    increment consecutive counter is true
    

    
print p3()
