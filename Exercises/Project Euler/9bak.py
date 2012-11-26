import math

def p9():
    target = 1000

    for i in range(target, 0, -1):
            for j in range(i-1, 0, -1):
                if i + j >= target: # or math.sqrt(i**2 - j**2)%1 != 0:
                    break
                else:
                    for k in range(j-1, 0, -1):
                        print
                        print 'i:', i
                        print 'j:', j

                        print 'k:', k
                        if i + j + k == target:
                            if i**2 == j**2 + k**2:
                                return "Answer:", i,j,k
                        else:
                            break
                    

#print p9()

def test():
    for i in range (1000,1,-1):
        j = i -1
#        print math.sqrt(i**2 - j**2)%1
        if math.sqrt(i**2 - j**2)%1 == 0:            
            print True
            print "i, j, k:", i, j, math.sqrt(i**2 - j**2)


test()
