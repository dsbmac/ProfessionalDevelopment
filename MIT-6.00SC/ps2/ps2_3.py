def evaluate_poly(poly, x):
    result = None
    if len(poly) > 0:
        result = 0.0
        power = len(poly) - 1
        i = 0
        while i <= power:
            result = result + poly[i] * x**i
            i +=1
    return result

#input poly list and outputs the derivative list
def compute_deriv(poly):
    result = []
    power = len(poly) - 1
    i = 1 #start
    while i <= power: #traverse poly and append values into result
        result.append(poly[i] * i)
        i +=1
    return result

def withinEpsilon(x, y, epsilon):
    """x,y,epsilon ints or floats.  epsilon > 0.0
       returns True if x is within epsilon of y"""
    return abs(x - y) <= epsilon

        
def compute_root_bi(poly, x_0, epsilon):
    i = 1
    sumX = 0
    while i <= len(poly) - 1 :
        if poly[i] > 0:
            sumX += poly[i]**i
        else:
            sumX -= poly[i]**i
        i +=1

    print sumX
    raw_input("Press Enter to continue...") #this pauses for debugging
    
    if sumX < 0:
        low = 0
        high = -1 * poly[0]
    else:
        low = -1 * poly[0]
        high = 0        
    ans = (high + low)/2.0
    while not withinEpsilon(evaluate_poly(poly,ans), 0, epsilon):
        print 'ans =', ans, 'low =', low, 'high =', high
        raw_input("Press Enter to continue...")
        if evaluate_poly(poly,ans) < 0:
           low = ans
        else:
           high = ans
        ans = (high + low)/2.0
    return ans

##newton's version of the root finding with a derivative search
def compute_root(poly, x_0, epsilon):
    ans = x_0
    count = 1
    while not withinEpsilon(evaluate_poly(poly, ans), 0, epsilon):
        count +=1
        #print 'ans =', ans, 'count =', count #debug info
        #raw_input("Press Enter to continue...") #this pauses for debugging
        ans = ans - evaluate_poly(poly,ans) / evaluate_poly(compute_deriv(poly) , ans)
    
    return ans, count

poly =(-13.39, 0.0, -17.5, 3.0, 1.0)  #x4 + 3.0x3 + 17.5x2 - 13.39 
x_0 = 0.1 
epsilon = .0001

#print compute_root_bi(poly, x_0, epsilon)
print compute_root(poly, x_0, epsilon)



