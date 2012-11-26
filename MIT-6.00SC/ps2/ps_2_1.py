##This function evaluates a polynomial function for the given x value. It takes
##in a tuple of numbers poly and a number x (float). evaluate_poly
##takes the polynomial represented by poly and computes its value at x.
##It returns a float value.

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

#print evaluate_poly([0.0, 0.0, 5.0, 9.3, 7.0], -13)
print compute_deriv([-13.39, 0.0, 17.5, 3.0, 1.0,2.3])
