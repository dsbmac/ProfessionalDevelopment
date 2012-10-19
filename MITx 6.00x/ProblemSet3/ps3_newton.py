# 6.00x Problem Set 3
#
# Successive Approximation: Newton's Method
#

# Problem 1: Polynomials
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

# Problem 2: Derivatives
def computeDeriv(poly):
    '''
    Computes and returns the derivative of a polynomial function as a list of
    floats. If the derivative is 0, returns [0.0].
 
    poly: list of numbers, length &gt; 0
    returns: list of numbers (floats)
    '''
    # FILL IN YOUR CODE HERE...
    result = []
    for b in range(len(poly)):
        if b == 0 and len(poly) == 1:
            result.append(0.0)
        elif b > 0:
            a = poly[b]
            result.append( float( a  * b ) )

    return result        


# Problem 3: Newton's Method
def computeRoot(poly, x_0, epsilon):
    '''
    Uses Newton's method to find and return a root of a polynomial function.
    Returns a list containing the root and the number of iterations required
    to get to the root.
 
    poly: list of numbers, length > 1.
         Represents a polynomial function containing at least one real root.
         The derivative of this polynomial function at x_0 is not 0.
    x_0: float
    epsilon: float > 0
    returns: list [float, int]
    '''
    # FILL IN YOUR CODE HERE...
    return RecComputeRoot(poly, x_0, epsilon)
    
def RecComputeRoot(poly, x_0, epsilon, count=0):
    if abs( evaluatePoly(poly, x_0) )  <= epsilon:
        return [x_0, count]
    else:
        x_1 = x_0 - ( evaluatePoly(poly, x_0) /  evaluatePoly( computeDeriv(poly), x_0) )
        return RecComputeRoot(poly, x_1, epsilon, count + 1)   
    
print computeRoot([-13.39, 0.0, 17.5, 3.0, 1.0], 0.1,  .0001)
print computeRoot([1, 9, 8], -3, .01)
print computeRoot([1, -1, 1, -1], 2, .001)
    
##print computeDeriv([-13.39, 0.0, 17.5, 3.0, 1.0])
##print computeDeriv([6, 1, 3, 0])
##print computeDeriv([20])
##print computeDeriv([])
