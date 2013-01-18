def factorial(x):

    #base case
    if x == 0 or x == 1:
        result = 1
    else:
        result = x * factorial(x-1)

    return result

def p20():
    result = 0
    s = str(factorial(100))
    for c in s:
        result += int(c)

    return result
    

print p20()
