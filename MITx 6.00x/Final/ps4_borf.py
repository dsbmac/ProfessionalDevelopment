import random

count = 0
results = []

class Borf(object):
    def __init__(self, name):
        self.name = name
        self.left = None
        self.right = None
    def setLeft(self, left):
        self.left = left
    def setRight(self, right):
        self.right = right
    def getLeft(self):
        return self.left
    def getRight(self):
        return self.right
    def myName(self):
        return self.name
    def insert(self, new):
        global count
        print 'called'
        count +=1
        if new.myName() < self.myName():
            if self.getLeft() == None:
                self.setLeft(new)
            else:
                self.getLeft().insert(new)
        elif new.myName() > self.myName():
            if self.getRight() == None:
                self.setRight(new)
            else:
                self.getRight().insert(new)
        else:
            print 'names identical'


def test():
    global count, results

    for i in range(10):
        e = 'eric'
        a = 'andrew'
        r = 'ruth'
        f = 'fred'
        m = 'martha'
        
        names = [e, a, r, f, m]
        
        for j in range(30):
            count = 0
            brf = Borf(random.choice(names))            
            brf2 = Borf(random.choice(names))
            print 'brf:', brf.myName()
            print 'brf2:', brf2.myName()
            brf.insert(brf2)
            
    ##    e.insert(a)
    ##    e.insert(r)
    ##    e.insert(f)    
        results.append(count)

test()
print results
    
