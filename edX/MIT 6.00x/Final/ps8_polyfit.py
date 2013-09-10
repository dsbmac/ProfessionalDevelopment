import pylab

a = 1.0
b = 2.0
c = 4.0
yVals = []
xVals = range(-20, 20)
for x in xVals:
    yVals.append(a*x**2 + b*x + c)
yVals = 2*pylab.array(yVals)
xVals = pylab.array(xVals)

def findOrder(xVals, yVals, accuracy = 1.0e-1):
    order = 0
    x = pylab.polyfit(xVals, yVals, order, full=True)
    residual = x[1][0]
    while residual > accuracy:
        
        order +=1
        try:            
            x = pylab.polyfit(xVals, yVals, order, full=True)
            residual = x[1][0]
            print 'residual', residual
        except:
            print 'fell to here'
    return x[0]

print findOrder(xVals, yVals, accuracy = 1.0e-1)
