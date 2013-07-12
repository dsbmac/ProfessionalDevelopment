def integrate(f, a, b, parts):
    print 'parts:', parts
    spacing = float(b-a)/parts
    current = 0
    for i in range(parts):
        current += spacing * f(a+ i*spacing)
    return current

def successiveApproxIntegrate(f, a, b, epsilon):
    # Your Code Here    
    high = 3
    low = 2
    diff = abs( integrate(f, a, b, high) - integrate(f, a, b, high/2) )
    
    while diff >= epsilon:
        low = high
        high = high * 2        
        diff = abs( integrate(f, a, b, high) - integrate(f, a, b, high/2) )
        print 'diff:', diff
##    print 'lower bound'
##    while diff < epsilon:
##        low += (high - low ) /2
##        diff = abs( integrate(f, a, b, low) - integrate(f, a, b, low/2) )
##        print 'diff:', diff
    return integrate(f, a, b, high)

def evaluatePoly(poly, x):
    '''
    Computes the value of a polynomial function at given value x. Returns that
    value as a float.
 
    poly: list of numbers, length > 0
    x: number
    returns: float
    '''
    # FILL IN YOUR CODE HERE...
    result = 0
    for i in range(len(poly)):
        result += poly[i] * x **  i
    return result

def test():
    poly = [-13.39, 0.0, 17.5, 3.0, 1.0]
    a = 0
    b= 10
    epsilon = 0.1
    def f(x):
        return x ** 2 + 5
    print successiveApproxIntegrate(f, a, b, epsilon)

test()
        
