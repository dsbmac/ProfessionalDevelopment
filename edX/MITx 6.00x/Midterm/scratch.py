def laceStrings(s1, s2):
    """
    s1 and s2 are strings.

    Returns a new str with elements of s1 and s2 interlaced,
    beginning with s1. If strings are not of same length, 
    then the extra elements should appear at the end.
    """
    result = ''
    index = 0
    while ( index < len(s1) or index < len(s2) ):
        if index < len(s1):
            result += s1[index]
        if index < len(s2):
            result += s2[index]
        index += 1
    return result
            
def laceStringsRecur(s1, s2):
    """
    s1 and s2 are strings.

    Returns a new str with elements of s1 and s2 interlaced,
    beginning with s1. If strings are not of same length, 
    then the extra elements should appear at the end.
    """
    def helpLaceStrings(s1, s2, out):
        if s1 == '':
            return out + s2
        if s2 == '':
            return out + s1
        else:
            return helpLaceStrings(s1[1:], s2[1:], out + s1[0] + s2[0])
    return helpLaceStrings(s1, s2, '')


def myLog(x, b):
    result = 0
    while( True ):
        if b ** result > x:
            result -= 1
            return result
        result += 1
    return result

def sort1(lst):
    swapFlag = True
    iteration = 0
    while swapFlag:
        swapFlag = False
        for i in range(len(lst)-1):
            if lst[i] > lst[i+1]:
                temp = lst[i+1]
                lst[i+1] = lst[i]
                lst[i] = temp
                swapFlag = True

        # the questions below refer to this point, assuming we set L = lst[:] here
        L = lst[:]
        print L
        iteration += 1
    return lst

def sort2(lst):
    for iteration in range(len(lst)):
        minIndex = iteration
        minValue = lst[iteration]
        for j in range(iteration+1, len(lst)):
            if lst[j] < minValue:
                minIndex = j
                minValue = lst[j]
        temp = lst[iteration]
        lst[iteration] = minValue
        lst[minIndex] = temp
        # the questions below refer to this point, assuming we set L = lst[:] here
        L = lst
        print L
    return lst

def sort3(lst):
    out = []
    for iteration in range(0,len(lst)):
        new = lst[iteration]
        inserted = False
        for j in range(len(out)):
            if new < out[j]:
                out.insert(j, new)
                inserted = True
                break
        if not inserted:
            out.append(new)
        # the questions below refer to this point, assuming we set L = out[:] here
        L = out[:]
        print L
    return out

def sort4(lst):
    def unite(l1, l2):
        if len(l1) == 0:
            return l2
        elif len(l2) == 0:
            return l1
        elif l1[0] < l2[0]:
            return [l1[0]] + unite(l1[1:], l2)
        else:
            return [l2[0]] + unite(l1, l2[1:])

    if len(lst) == 0 or len(lst) == 1:
        return lst
    else:
        front = sort4(lst[:len(lst)/2])
        back = sort4(lst[len(lst)/2:])
        # the questions below refer to this point, assuming we set L = lst[:] here
        L = lst[:]
        print L
        return unite(front, back)

def McNuggets(n):
    """
    n is an int

    Returns True if some integer combination of 6, 9 and 20 equals n
    Otherwise returns False.
    """
    boxes = [6, 9, 20]
    def RecNuggets(n, soFar, boxes):
        if min(boxes) > n : return False
        if n == soFar: return True
        if soFar > n: return False
        for boxSize in boxes:
            if( RecNuggets(n, soFar + boxSize, boxes)) : return True
        return False
    return RecNuggets(n, 0, boxes)

##def sqrt(a):
##    def tryit(x):
##        return 0.5 * (a/x + x)
##    
##    def fixedPoint(f, epsilon):
##        """
##        f: a function of one argument that returns a float
##        epsilon: a small float
##      
##        returns the best guess when that guess is less than epsilon 
##        away from f(guess) or after 100 trials, whichever comes first.
##        """
##        guess = 1.0
##        for i in range(100):
##            if abs(f(guess) - guess) < epsilon:
##                return guess
##            else:
##                guess = f(guess)
##        return guess
##
##    return fixedPoint(tryit, 0.0001)

def fixedPoint(f, epsilon):
        """
        f: a function of one argument that returns a float
        epsilon: a small float
      
        returns the best guess when that guess is less than epsilon 
        away from f(guess) or after 100 trials, whichever comes first.
        """
        guess = 1.0
        for i in range(100):
            if abs(f(guess) - guess) < epsilon:
                return guess
            else:
                guess = f(guess)
        return guess
    


def sqrt(a):
    def babylon(x):
        return 0.5 * ((a / x) + x)
    return fixedPoint(babylon, 0.0001)


print sqrt(9)

##m = [0, 1, 6, 8, 13, 28]
##for order in m:
##    print "order:", order
##    print McNuggets(order)
##    print

#print McNuggets(8)
   
##l1 = [3,5,1]
##sort1(l1)
##print
##sort2(l1)
##print
##sort3(l1)
##print
##sort4(l1)



