import random
import pylab

##def MontyChoose():
##  car = randint(1,3)
##  contestantIntialChoice = randint(1,3)
##  
##
##def montyChoose(guessDoor, prizeDoor):
##  if 1 != guessDoor and 1 != prizeDoor:
##    return 1
##  if 2 != guessDoor and 2 != prizeDoor:
##    return 2
##  return 3
##
def randomChoose(guessDoor, prizeDoor):
  if guessDoor == 1:
    return random.choice([2,3])
  if guessDoor == 2:
    return random.choice([1,3])
  return random.choice( [1,2] )
  
def simMontyHall(numTrials = 100, chooseFcn = montyChoose):
  stickWins = 0
  switchWins = 0
  noWin = 0
  prizeDoorChoices = [(1,2,3)]
  guessChoices = [(1,2,3)]
  for t in range(numTrials):
    prizeDoor = random.choice([1,2,3])
    guess =  random.choice([1,2,3])
    toOpen = chooseFcn(guess, prizeDoor)
    if toOpen == prizeDoor:
      noWin +=1
    elif guess == prizeDoor:
      stickWins +=1
    else:
      switchWins +=1
  return (stickWins, switchWins)

def displayMHSim(simResults):
  stickWins, switchWins = simResults;
  pylab.pie( [stickWins, switchWins], colors = ['r', 'g'],
             labels = ['stick', 'change'], autopct = '%.2f%%')
  pylab.title('To Switch or Not to Switch')

def montyChoose(guessDoor, prizeDoor): 
  if 1 != guessDoor and 1 != prizeDoor: 
      return 1 
  if 2 != guessDoor and 2 != prizeDoor: 
      return 2 
  return 3 
 


simResults = simMontyHall(100000, montyChoose)
displayMHSim(simResults)
pylab.figure()
simResults = simMontyHall(100000, randomChoose)
displayMHSim(simResults)
pylab.show()


def montyChoose()

def randomChoose():


def montyHallSim():
  prizeDoors = [1,2,3]  
  playerFirstChoice = random.choice(prizeDoors)
  prizeDoor = random.choice(prizeDoors)
                                      
