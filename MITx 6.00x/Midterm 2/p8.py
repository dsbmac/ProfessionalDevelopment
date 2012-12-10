
def probTest(limit):
    if limit <= 0: return 0
    if limit > 1.0/6: return 1
    prob = 0
    n = 1
    while True:
        #print 'n', n
        prob = ((5.0 / 6) ** n) * (1.0 / 6)
        #print prob, limit
        if prob < limit: return n+1
        n +=1
   

def test():
    limits = [0, 0.5, 1.0/6, (5.0/36), (25.0/216), 0.01]
    for limit in limits:
        print
        ans = probTest(limit)
        print 'ans', ans
    
test()
