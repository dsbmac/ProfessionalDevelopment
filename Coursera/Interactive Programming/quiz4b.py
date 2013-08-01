def test():
    a = ["green", "blue", "white", "black"]
    b = a
    c = list(a)
    d = c
    a[3] = "red"
    c[2] = a[1]
    b = a[1:3]
    b[1] = c[2]
    print repr( a)
    print repr( b)
    print repr( c)
    print repr( d)

def test2():
    result = 5
    for i in range(12):
        result *= 2
        result -= 3
        print result

test2()
