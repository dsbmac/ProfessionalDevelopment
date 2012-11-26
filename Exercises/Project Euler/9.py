import math

def p9():
    target = 1000

    for c in range(target, 0, -1):
            for b in range(c-1, 0, -1):
                if c + b + math.sqrt(c**2 - b**2) == target:
                    return "Answer:", c,b,math.sqrt(c**2 - b**2), c*b*math.sqrt(c**2 - b**2)
                    
print p9()

#solution
##c=0
##while True:
##	for b in range(0,c):
##		for a in range(0,b):
##			if a**2 + b**2 == c**2:
##				if a+b+c == 1000:
##					print "a=%d, b=%d, c=%d a*b*c=%d" % (a,b,c,a*b*c)
##	c+=1

def test():
    for i in range (1000,1,-1):
        j = i -1
#        print math.sqrt(i**2 - j**2)%1
        if math.sqrt(i**2 - j**2)%1 == 0:            
            print True
            print "i, j, k:", i, j, math.sqrt(i**2 - j**2)


#test()
