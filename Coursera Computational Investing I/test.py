def b(data):
    data += 1

def a():
    data = 1
    b(data)
    print data

a()
