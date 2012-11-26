def is_prime(x):
    if x == 2 or x == 3:
        return True

    if x <= 1:
        return False

    for i in range(5,int(x**0.5) + 1, 2):
        if x % i == 0:
            return False
        
    return True

#print number if it is prime between the range
def is_prime_range(x, y):
    for i in range(x,y):
        if is_prime(i):
            print i

def is_prime_sum_range(x, y):
    result = 0
    for i in range(x,y):
        if is_prime(i):
            result += i
    print result

def permu_prime(x, y):
    for i in range(x,y):
        if is_prime(i):
            #first put the digits of the number into a list
            digits = []
            d = str(i)
            for c in d:
                digits.append(c)
#                print len(permu)
            #next make permutations of those digits
            for i in range(0,len(digits)):
                print digits
                permu = []
                permu = ''.join(digits)
                print permu


                

#print is_prime(2)
#is_prime_sum_range(1, 100)
#is_prime_range(1000, 9999)
permu_prime(1000,1010)
    
