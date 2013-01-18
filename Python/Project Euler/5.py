##def p5():
##    i = 0
##    x = None
##    result = None
##    div = [18,15,16]
##    while x != 16:
##        i += 20*19*17*14*13*11
##        result = i
##        print 'i:', i
##        for j in div:
##            print "j:", j
##            if i % j != 0:
##                break
##            x = j
##
##        
##    return result

##print p5()

def p5b():
    i = 1
    for k in (range(1, 21)):
        if i % k > 0:
            for j in range(1, 21):
                if (i*j) % k == 0:
                    i *= j
                    break
    print i              

p5b()
