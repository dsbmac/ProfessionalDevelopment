import pylab
import random
import math

class Location(object):
    def __init__(self, x, y):
        """x and y are floats"""
        self.x = x
        self.y = y
        
    def move(self, deltaX, deltaY):
        """deltaX and deltaY are floats"""
        return Location(self.x + deltaX, self.y + deltaY)
    
    def getX(self):
        return self.x
    
    def getY(self):
        return self.y
    
    def distFrom(self, other):
        ox = other.x
        oy = other.y
        xDist = self.x - ox
        yDist = self.y - oy
        return (xDist**2 + yDist**2)**0.5
    
    def __str__(self):
        return '<' + str(self.x) + ', ' + str(self.y) + '>'

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
        currentLocation = self.drunks[drunk]
        #use move method of Location to get new location
        self.drunks[drunk] = currentLocation.move(xDist, yDist)
        
    def getLoc(self, drunk):
        if not drunk in self.drunks:
            raise ValueError('Drunk not in field')
        return self.drunks[drunk]

class Drunk(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'This drunk is named ' + self.name

##
##def walkVector(f, d, numSteps):
##    start = f.getLoc(d)
##    for s in range(numSteps):
##        f.moveDrunk(d)
##    return(f.getLoc(d).getX() - start.getX(),
##           f.getLoc(d).getY() - start.getY())
##
##class UsualDrunk(Drunk):
##    def takeStep(self):
##        stepChoices =\
##            [(0.0,1.0), (0.0,-1.0), (1.0, 0.0), (-1.0, 0.0)]
##        return random.choice(stepChoices)
##
##class ColdDrunk(Drunk):
##    def takeStep(self):
##        stepChoices =\
##            [(0.0,0.9), (0.0,-1.03), (1.03, 0.0), (-1.03, 0.0)]
##        return random.choice(stepChoices)
##
##class EDrunk(Drunk):
##    def takeStep(self):
##        ang = 2 * math.pi * random.random()
##        length = 0.5 + 0.5 * random.random()
##        return (length * math.sin(ang), length * math.cos(ang))
##
##class PhotoDrunk(Drunk):
##    def takeStep(self):
##        stepChoices =\
##                    [(0.0, 0.5),(0.0, -0.5),
##                     (1.5, 0.0),(-1.5, 0.0)]
##        return random.choice(stepChoices)
##
##class DDrunk(Drunk):
##    def takeStep(self):
##        stepChoices =\
##                    [(0.85, 0.85), (-0.85, -0.85),
##                     (-0.56, 0.56), (0.56, -0.56)] 
##        return random.choice(stepChoices)

def walkVector(f, d, numSteps):
    start = f.getLoc(d)
    for s in range(numSteps):
        f.moveDrunk(d)
    return(f.getLoc(d).getX() - start.getX(),
           f.getLoc(d).getY() - start.getY())

class DrunkA(Drunk):
    def takeStep(self):
        if random.random() < 0.5:
            if random.random() < 0.5:
                return (random.random(), random.random())
            else:
                return (random.random(), -1 * random.random())
        else:
            if random.random() < 0.5:
                return (-1 * random.random(), random.random())
            else:
                return (-1 * random.random(), -1*random.random())

class DrunkB(Drunk):
    def takeStep(self):
        stepChoices =\
            [(0.0,0.9), (0.0,-1.1), (1.0, 0.0), (-1.0, 0.0)]
        return random.choice(stepChoices)

class DrunkC(Drunk):
    def takeStep(self):
        ang = 2 * math.pi * random.random()
        length = 0.5 + 0.4 * random.random()
        return (length * math.sin(ang), length * math.cos(ang))

class DrunkD(Drunk):
    def takeStep(self):
        stepChoices =\
                    [(0.0, 1.0),(0.0, -1.0),
                     (0.9, 0.0),(-1.1, 0.0)]
        return random.choice(stepChoices)

class DrunkE(Drunk):
    def takeStep(self):
        stepChoices =\
                    [(0.85, 0.85), (-0.85, -0.85),
                     (-0.56, 0.56), (0.56, -0.56)]
        return random.choice(stepChoices)

def sim():
    drunks = (DrunkA, DrunkB, DrunkC, DrunkD, DrunkE)
    #drunks = (DDrunk,)
    for j, dType in enumerate(drunks):
        
        f = Field()
        origin = Location(0,0)
        d = dType('Homer')
        f.addDrunk(d, origin)

        xVals = []
        yVals = []
        numSteps = 800
        numTrials = 800
        for i in range(numTrials):
            xVals.append(walkVector(f, d, numSteps)[0])
            yVals.append(walkVector(f, d, numSteps)[1])

        pylab.figure(j)    
        pylab.plot(xVals, yVals, 'yo')
        pylab.xlim([-100, 100])
        pylab.ylim([-100, 100])
        pylab.title(str(dType))
    pylab.show()

sim()
    
