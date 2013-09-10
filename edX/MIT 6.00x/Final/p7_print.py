import pylab

a = 3.0
b = 2.0
c = 1.0
yVals = []
xVals = range(-20, 20)
for x in xVals:
    yVals.append(a*x**2 + b*x + c)
yVals = pylab.array(yVals)
xVals = 2*pylab.array(xVals)
try:
    a, b, c, d = pylab.polyfit(xVals, yVals, 3)
    print a, b, c, d
except:
    print 'unable to fit'
