import random

class Location(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __str__(self, x, y):
        print '<' + self,x, self.y + '>'
    def move(self, deltaX, deltaY):
        return Location(self.x + deltaX, self.y + deltaY)
    def getX(self):
        return self.x
    def getY(self):
        return self.y
    def distFrom(self, other):
        return ( (other.x - self.x)**2 + (other.y - self.y)**2 )**0.5

class Field(object):
    def __init__(self):
        self.drunks = {}
    def addDrunk(self, drunk, loc):
        if drunk in self.drunks:
            raise ValueError('Duplicate drunk')
        else:
            self.drunks[drunk] = loc
            
    def moveDrunk(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')            
        xDist, yDist = drunk.takeStep()
        self.drunks[drunk] = self.drunks[drunk].move(xDist, yDist)

    def getLoc(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in filed')
        return self.drunks[drunk]        

class Drunk(object):
    def __init__(self, name):
        self.name = name
    def takeStep(self):
        stepChoices = [(0,1), (0,-1), (1, 0), (-1, 0)]
        return random.choice(stepChoices)
    def __str__(self):
        return 'This drunk is name ' + self.name

def walk(f, d, numSteps):
    start = f.getLoc(d)
    for s in range(numSteps):
        f.moveDrunk(d)
    return(start.distFrom(f.getLoc(d)))

def simWalks(numSteps, numTrials):
    homer = Drunk('homer')
    origin = Location(0, 0)
    results = []
    for trial in range( numTrials):
        f = Field()
        f.addDrunk(homer, origin)
        results.append(walk( f, homer, numSteps))
    return results
        
def drunkTest(numTrials):
    numSteps = [10, 100, 1000, 10000, 100000]
 #   numSteps = [0, 1]
    for steps in numSteps:
        distances = simWalks(steps, numTrials)
        print 'Random walk of ' + str(steps) + ' steps' 
        print '  Mean =', sum(distances)/len(distances) 
        print '  Max =', max(distances), 'Min =', min(distances)  
        

drunkTest(20)

    
