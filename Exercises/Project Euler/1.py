def sum_3_5():
    result = 0
    for i in range(1,1000):
        if i % 3 == 0 or i % 5 == 0:
           result += i
           print i
    return result

print sum_3_5()
           
    
