def factor_list(x):    
    if x == 1:
        return [1]
    
    limit = int( x/2)+1
    factors = [1]

    for i in range (2, limit):
        if x % i == 0:
            factors.append(i)
    factors.append(x)

    return factors
    
def triangle_list(x, y):
    result = []
    sum = 0
    
    for i in range(x,y):
        sum += i
        result.append(sum)
    return result

def p12():

    sum = 0
    limit = 500
    divisors = 0
    
    i = 1
    while divisors <= limit:
        print "i:", i
        sum += i
        print "triangle_num: " + str( sum)
        divisors = len(factor_list(sum))
        print "divisors: " + str(divisors)
        i +=1
    
    return sum

def p12b(n):
    sum = 0
    for i in range(n,0,-1):
        sum += i
    print "triangle num:", sum
    divisors = len(factor_list(sum))
    print "divisors: " + str(divisors)    
    
#print factor_list(28)
p12b(10000)

#print triangle_list(1,7)
