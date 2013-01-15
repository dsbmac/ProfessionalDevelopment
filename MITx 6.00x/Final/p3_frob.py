class Frob(object):
    def __init__(self, name):
        self.name = name
        self.before = None
        self.after = None
    def setBefore(self, before):
        self.before = before
    def setAfter(self, after):
        self.after = after
    def getBefore(self):
        return self.before
    def getAfter(self):
        return self.after
    def myName(self):
        return self.name

def insert(atMe, newFrob):
    """
    atMe: a Frob that is part of a doubly linked list
    newFrob:  a Frob with no links 
    This procedure appropriately inserts newFrob into the linked list that atMe is a part of.    
    """
    
    if atMe.myName() == newFrob.myName():
        if atMe.getAfter() != None:
            temp = atMe.getAfter()
            newFrob.setAfter(temp)
            temp.setBefore(newFrob)
        atMe.setAfter(newFrob)
        newFrob.setBefore(atMe)
        
    elif atMe.myName() < newFrob.myName():
        if atMe.getAfter() == None or newFrob.myName() < atMe.getAfter().myName():
            if atMe.getAfter() != None:
                temp = atMe.getAfter()
                newFrob.setAfter(temp)
                temp.setBefore(newFrob)
            atMe.setAfter(newFrob)
            newFrob.setBefore(atMe)
            
        else:
            insert(atMe.getAfter(), newFrob)

    elif atMe.myName() > newFrob.myName():
        if atMe.getBefore() == None or atMe.getBefore().myName() < newFrob.myName():
            if atMe.getBefore() != None:
                temp = atMe.getBefore()
                newFrob.setBefore(temp)
                temp.setAfter(newFrob)     
            atMe.setBefore(newFrob)            
            newFrob.setAfter(atMe)
               
        else:
            insert(atMe.getBefore(), newFrob)        

def findFront(start):
    """
    start: a Frob that is part of a doubly linked list
    returns: the Frob at the beginning of the linked list 
    """
    # Your Code Here
    if start.getBefore() == None:
        return start
    else:        
        return findFront(start.getBefore())

def test():
    eric = Frob('eric')
    andrew = Frob('andrew')
    ruth = Frob('ruth')
    fred = Frob('fred')
    martha = Frob('martha')
    
    insert(andrew, eric)
    insert(eric, ruth)
    insert(eric, fred)
    insert(ruth, martha)
    insert(eric, Frob('martha'))
    
    f = andrew
    while f != None:
        print f.myName() + ': '
        try:
            print '  before:', f.getBefore().myName(), f.getBefore()
        except:
            print
        try:
            print '  after:', f.getAfter().myName(), f.getAfter()
        except:
            print

        f = f.getAfter()
            
def test2():
    eric = Frob('eric')
    andrew = Frob('andrew')
    ruth = Frob('ruth')
    fred = Frob('fred')
    martha = Frob('martha')
    
    insert(andrew, eric)
    insert(eric, ruth)
    insert(eric, fred)
    insert(ruth, martha)

    f = findFront(ruth)
    print f.myName()

test2()

