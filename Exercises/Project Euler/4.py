def is_pal(x):
    s = str(x)
    
    #base case
    if s == '0':
        return True
    if s == '':
        return True
    
    return s[0] == s[-1] and is_pal(s[1:-1])

def p4():
    l = []
    
    for i in range(999, 800, -1):
        for j in range(999, 800, -1):
#            print 'i: ' + str(i) + ' j: ' + str(j) + ' i*j: ' + str(i*j)
            if is_pal(i * j):
                print str(i) + str(j)
                l.append(i * j)
                print l
    return max(l)
            
print p4()
