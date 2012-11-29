def ints(start, end = None):
    i = start
    while i <= end or end is None:
        yield i
        i = i + 1
    

def all_ints():
    "Generate integers in the order 0, +1, -1, +2, -2, +3, -3, ..."
    "0, 1, -2, 4, -6,"
    i, j, n = 0, -1, 0
    
    while True:        
        yield n        
        i += 1        
        j *= -1
        n += i * j

itr = all_ints()
for i in itr:
    print i
