##can you trace this function? Why does it output what it does?
def test1():
  x = 42
  y = x
  x = x + 1
  print x
  print y

def test2():
  x = [ 1, 2, 3 ]
  y = x
  x[0] = 4
  print x
  print y


def test3():
  x = ['foo', [1,2,3], 10.4]
  y = list(x) # or x[:]
  y[0] = 'fooooooo'
  y[1][0] = 4
  print x
  print y
  
test3()
