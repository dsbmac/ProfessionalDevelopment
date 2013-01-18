x = 1.5
epsilon = 0.01
low = 0.0
high = max(x,1)
ans = (high + low)/2.0
while abs(ans**2 - x) >= epsilon:
    print 'ans =', ans, 'low =', low, 'high =', high
    if ans**2 < x: 
        low = ans 
    else: 
        high = ans
    ans = (high + low)/2.0

print ans, 'is close to square root of', x 
