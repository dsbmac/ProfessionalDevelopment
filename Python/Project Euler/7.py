def is_prime(x):
    if x == 2:
        return True

    if x <= 1 or x % 2 == 0:
        return False
    
    for i in range(3,int(x**0.5) + 1, 2):
        if x % i == 0:
            return False
        
    return True

def prime_list_limit(x, y, z):
    result = []
    for i in range(x,y):
        if is_prime(i):
            result.append(i)
        if len(result) == z:
            print "z reached"
            break
    return result[-1], result.index(result[-1])

print prime_list_limit(1, 1000000, 10001)
