def is_palin(x):
    sx = str(x)
    if len(sx) == 1:
        return True
    else:
        return sx[0] == sx[-1] and is_palin(sx[1:-1])

def decimal_in_binary(x):
    print
    print x
    if x == 0:
        return str(1)
    else:
        f = x/2
        slen = len('%.*f' % (0, f))
        res = str(f)[:slen]
        print str(x % 2 )
        return str(x % 2  ) + decimal_in_binary(x - int(res))
    
#print decimal_in_binary(294)                         

