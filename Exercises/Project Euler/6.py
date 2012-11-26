def square_sum(x):
    result = 0
    for i in range(1, x+1):
        result += i
    return result**2

def sum_squares(x):
    result = 0
    for i in range(1, x+1):
        result += i**2
    return result

  
    

def p6():
    limit = 100
    result =  square_sum(limit) - sum_squares(limit)
    print result

p6()
