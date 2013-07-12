# multiAgents.py
# --------------
# Licensing Information: Please do not distribute or publish solutions to this
# project. You are free to use and extend these projects for educational
# purposes. The Pacman AI projects were developed at UC Berkeley, primarily by
# John DeNero (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and Pieter 
# Abbeel in Spring 2013.
# For more info, see http://inst.eecs.berkeley.edu/~cs188/pacman/pacman.html

from util import manhattanDistance
from game import Directions
from searchAgents import mazeDistance
import random, util, math, itertools

from game import Agent

class ReflexAgent(Agent):
    """
      A reflex agent chooses an action at each choice point by examining
      its alternatives via a state evaluation function.

      The code below is provided as a guide.  You are welcome to change
      it in any way you see fit, so long as you don't touch our method
      headers.
    """


    def getAction(self, gameState):
        """
        You do not need to change this method, but you're welcome to.

        getAction chooses among the best options according to the evaluation function.

        Just like in the previous project, getAction takes a GameState and returns
        some Directions.X for some X in the set {North, South, West, East, Stop}
        """
        # Collect legal moves and successor states
        legalMoves = gameState.getLegalActions()

        # Choose one of the best actions
        scores = [self.evaluationFunction(gameState, action) for action in legalMoves]
        bestScore = max(scores)
        bestIndices = [index for index in range(len(scores)) if scores[index] == bestScore]
        chosenIndex = random.choice(bestIndices) # Pick randomly among the best

        "Add more of your code here if you want to"

        return legalMoves[chosenIndex]

    def evaluationFunction(self, currentGameState, action):
        """
        Design a better evaluation function here.

        The evaluation function takes in the current and proposed successor
        GameStates (pacman.py) and returns a number, where higher numbers are better.

        The code below extracts some useful information from the state, like the
        remaining food (newFood) and Pacman position after moving (newPos).
        newScaredTimes holds the number of moves that each ghost will remain
        scared because of Pacman having eaten a power pellet.

        Print out these variables to see what you're getting, then combine them
        to create a masterful evaluation function.
        """
        # Useful information you can extract from a GameState (pacman.py)
        successorGameState = currentGameState.generatePacmanSuccessor(action)
        newPos = successorGameState.getPacmanPosition()
        position = currentGameState.getPacmanPosition()
        newFood = successorGameState.getFood()
        size = float(newFood.width * newFood.height)
        newGhostStates = successorGameState.getGhostStates()
        ghostPositions = successorGameState.getGhostPositions()

        newScaredTimes = [ghostState.scaredTimer for ghostState in newGhostStates]

        "*** YOUR CODE HERE ***"        
        def findClosestFood(position, foodGrid):
          for x in range(newFood.width):
            for y in range(newFood.height):
              if foodGrid[x][y]:
                return util.manhattanDistance(position, (x,y))
          return 0

        def evalState(state):
          position = state.getPacmanPosition()     
          closestFood = findClosestFood(position, state.getFood())
          closestGhost = min(util.manhattanDistance(position, ghostPosition) for ghostPosition in ghostPositions)
          foodLeft = state.getNumFood()         
          score = state.getScore()
          scared = newScaredTimes[0] > 0

          a = 0
          if score < 0:
            a = -1 * math.log10(abs(score))
          elif score > 0:
            a = math.log10(score)

          b = -0.1 * closestFood
          c = -1 * foodLeft
          d = 1 * (( closestGhost**(1.0/4)) + ( 10 * scared * closestGhost))
          #print 'newScaredTimes', newScaredTimes
          #print 'score, closestFood, numFood, closestGhost', a, b, c, d
          result = a + b + c + d
          #print 'result', result
          return result

        currentScore = evalState(currentGameState)
        newScore = evalState(successorGameState)
        result = newScore - currentScore
        return result

def scoreEvaluationFunction(currentGameState):
    """
      This default evaluation function just returns the score of the state.
      The score is the same one displayed in the Pacman GUI.

      This evaluation function is meant for use with adversarial search agents
      (not reflex agents).
    """
    return currentGameState.getScore()

class MultiAgentSearchAgent(Agent):
    """
      This class provides some common elements to all of your
      multi-agent searchers.  Any methods defined here will be available
      to the MinimaxPacmanAgent, AlphaBetaPacmanAgent & ExpectimaxPacmanAgent.

      You *do not* need to make any changes here, but you can if you want to
      add functionality to all your adversarial search agents.  Please do not
      remove anything, however.

      Note: this is an abstract class: one that should not be instantiated.  It's
      only partially specified, and designed to be extended.  Agent (game.py)
      is another abstract class.
    """

    def __init__(self, evalFn = 'scoreEvaluationFunction', depth = '2'):
        self.index = 0 # Pacman is always agent index 0
        self.evaluationFunction = util.lookup(evalFn, globals())
        self.depth = int(depth)

    def createParams(self, state, agentIndex, depth, action):
      newState = state.generateSuccessor(agentIndex, action)
      nextAgentIndex = (agentIndex+1) % state.getNumAgents()
      newDepth = depth
      if nextAgentIndex == self.index:
        newDepth = depth + 1
      return newState, nextAgentIndex, newDepth

class MinimaxAgent(MultiAgentSearchAgent):
    """
      Your minimax agent (question 2)
    """

    def getAction(self, gameState):
        """
          Returns the minimax action from the current gameState using self.depth
          and self.evaluationFunction.

          Here are some method calls that might be useful when implementing minimax.

          gameState.getLegalActions(agentIndex):
            Returns a list of legal actions for an agent
            agentIndex=0 means Pacman, ghosts are >= 1

          gameState.generateSuccessor(agentIndex, action): 
            Returns the successor game state after an agent takes an action

          gameState.getNumAgents():
            Returns the total number of agents in the game
        """
        "*** YOUR CODE HERE ***"
        numAgents = gameState.getNumAgents()

        # print 'index:', self.index, 'searchDepth:', self.depth, 'numAgents:', numAgents
        # print

        def maxValue(state, agentIndex, depth):
          # print
          # print 'max agent...', agentIndex
          v = float("-infinity"), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)            
            v = max(v, (value(newState, nextAgentIndex, newDepth, action)[0], action))
          return v

        def minValue(state, agentIndex, depth):
          # print 'min agent...', agentIndex
          v = float('+infinity'), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = min(v, (value(newState, nextAgentIndex, newDepth, action)[0], action))
          return v

        def value(state, agentIndex, depth=0, action=None): 
          # print 'agent', agentIndex, 'depth', depth
          if depth == self.depth or state.isLose() or state.isWin(): 
            utility = self.evaluationFunction(state), action
            # print 'utility:', utility
            # print
            return utility
          elif agentIndex == 0:
            return maxValue(state, agentIndex, depth)
          else:
            return minValue(state, agentIndex, depth)

        result = value(gameState, self.index)[1]

        return result
            

class AlphaBetaAgent(MultiAgentSearchAgent):
    """
      Your minimax agent with alpha-beta pruning (question 3)
    """

    def getAction(self, gameState):
        """
          Returns the minimax action using self.depth and self.evaluationFunction
        """
        "*** YOUR CODE HERE ***"
        numAgents = gameState.getNumAgents()
        def maxValue(state, agentIndex, depth, alpha, beta):
          # print
          # print 'max agent...', agentIndex
          v = float("-infinity"), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = max(v, (value(newState, nextAgentIndex, newDepth, action, alpha, beta)[0], action))
            if v[0] > beta: 
              #print 'beta pruning...', v, beta
              return v
            alpha = max(alpha, v[0])
          return v

        def minValue(state, agentIndex, depth, alpha, beta):
          # print 'min agent...', agentIndex
          v = float('+infinity'), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = min(v, (value(newState, nextAgentIndex, newDepth, action, alpha, beta)[0], action))
            if v[0] < alpha:
              #print 'alpha pruning...', v, alpha
              return v
            beta = min(beta, v[0]) 
          return v

        def value(state, agentIndex, depth=0, action=None, alpha=float('-infinity'), beta=float('infinity')): 
          # print 'agent', agentIndex, 'depth', depth
          if depth == self.depth or state.isLose() or state.isWin(): 
            utility = self.evaluationFunction(state), action
            # print 'utility:', utility
            # print
            return utility
          elif agentIndex == 0:
            return maxValue(state, agentIndex, depth, alpha, beta)
          else:
            return minValue(state, agentIndex, depth, alpha, beta)

        result = value(gameState, self.index)[1]

        return result

class ExpectimaxAgent(MultiAgentSearchAgent):
    """
      Your expectimax agent (question 4)
    """

    def getAction(self, gameState):
        """
          Returns the expectimax action using self.depth and self.evaluationFunction

          All ghosts should be modeled as choosing uniformly at random from their
          legal moves.
        """
        "*** YOUR CODE HERE ***"

        numAgents = gameState.getNumAgents()

        # print 'index:', self.index, 'searchDepth:', self.depth, 'numAgents:', numAgents
        # print

        def maxValue(state, agentIndex, depth):
          # print
          # print 'max agent...', agentIndex
          v = float("-infinity"), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)            
            v = max(v, (value(newState, nextAgentIndex, newDepth, action)[0], action))
          return v

        def expValue(state, agentIndex, depth):
          # print 'min agent...', agentIndex
          v = 0, None
          actions = state.getLegalActions(agentIndex)
          p = 1.0 / len(actions)
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = v[0] + (p * value(newState, nextAgentIndex, newDepth, action)[0]), action
          return v

        def value(state, agentIndex, depth=0, action=None): 
          # print 'agent', agentIndex, 'depth', depth
          if depth == self.depth or state.isLose() or state.isWin(): 
            utility = self.evaluationFunction(state), action
            # print 'utility:', utility
            # print
            return utility
          elif agentIndex == 0:
            return maxValue(state, agentIndex, depth)
          else:
            return expValue(state, agentIndex, depth)

        result = value(gameState, self.index)[1]
        return result



closestFoodCache = {}
evalCache = {}

def betterEvaluationFunction(currentGameState):
    """
      Your extreme ghost-hunting, pellet-nabbing, food-gobbling, unstoppable
      evaluation function (question 5).

      DESCRIPTION: <write something here so we know what you did>
    """
    "*** YOUR CODE HERE ***"
    #if startNumFood == None: startNumFood = currentGameState.getNumFood()
    newFood = currentGameState.getFood()
    size = float(newFood.width * newFood.height)
    newGhostStates = currentGameState.getGhostStates()
    ghostPositions = currentGameState.getGhostPositions()

    def closestCapsule(position, capsules, state):
      result = min(mazeDistance(position, capsule, state) for capsule in capsules)
      return result

    def findClosestFood(nodes, foodGrid, capsules, wallGrid):
      # print foodGrid
      # print
      # print wallGrid
      distance = 0
      positionCache = []
      while not nodes.isEmpty():
        node = nodes.pop()
        position = node[0]
        #print 'pos:', position
        #util.pause()
        if position not in positionCache:
          positionCache.append(position)
          if foodGrid[position[0]][position[1]]  or position in capsules:
            return node[1]
          if not wallGrid[position[0]][position[1]]:
            for i in [(1,0), (0,1), (-1,0), (0,-1)]:
              newPos = (position[0] + i[0], position[1] + i[1])
              #print 'newPos:', newPos
              newNode = newPos, node[1]+1
              nodes.push(newNode)
      return 0
    
    def cumGhostsDistance(position, ghostPositions, state):
      ghostStates = state.getGhostStates()
      scaredTimes = [ghostState.scaredTimer for ghostState in ghostStates]
      total = 0
      for i in range(len(scaredTimes)):
        d = math.sqrt(mazeDistance(position, util.nearestPoint(state.getGhostPosition(i+1)), state))
        if scaredTimes[i] > 0:
          d = d * math.sqrt(scaredTimes[i])
        else:
          d *= -1 
        total += int(d)
      return total

    def evalState(state):
      position = state.getPacmanPosition()
      capsules = state.getCapsules()
      foodGrid = state.getFood()
      foodState = position, foodGrid, tuple(capsules)
      closestFood = None
      if foodState in closestFoodCache:
        closestFood = closestFoodCache[foodState]
      else:
        nodes = util.Queue()
        node = position, 0
        nodes.push(node)
        closestFood = findClosestFood(nodes, foodGrid, capsules, state.getWalls())
        closestFoodCache[foodState] = closestFood
      
      ghostState = position, tuple(ghostPositions)
      closestGhost = None
      if ghostState in evalCache:
        closestGhost = evalCache[ghostState]
      else:
        closestGhost = min(mazeDistance(position, util.nearestPoint(ghostPosition), state) for ghostPosition in ghostPositions)
        evalCache[ghostState] = closestGhost

      foodLeft = state.getNumFood()         
      score = state.getScore()
      #scared = newScaredTimes[0] > 0
      #cgd = cumGhostsDistance(position, ghostPositions, state)
      #numFoodEaten = startNumFood - foodLeft

      # a = 0
      # if score < 0:
      #   a = -1 * math.sqrt(abs(score))
      # elif score > 0:
      #   a = math.sqrt(score)
      a = score
      b = -1 * closestFood
      c = -1 * foodLeft**2
      #d = 0.5 * (( closestGhost**(1.0/4)) + ( 10 * scared * closestGhost))
      d = -1 * closestGhost
      #e = cgd
      f = 100 * len(capsules) 
      #print 'newScaredTimes', newScaredTimes
      #print 'score, closestFood, cgd', score, b, e
      result = a + b + d + f
      return result

    currentScore = evalState(currentGameState)
    result = currentScore
    return result

# Abbreviation
better = betterEvaluationFunction

class ContestAgent(MultiAgentSearchAgent):
    """
      Your agent for the mini-contest
    """
    startNumFood = None  

    def getAction(self, gameState):
        """
          Returns the expectimax action using self.depth and self.evaluationFunction

          All ghosts should be modeled as choosing uniformly at random from their
          legal moves.
        """
        "*** YOUR CODE HERE ***"
        self.evaluationFunction = better
        self.depth = 3
        numAgents = gameState.getNumAgents()

        def maxValue(state, agentIndex, depth):
          # print
          # print 'max agent...', agentIndex
          v = float("-infinity"), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)            
            v = max(v, (value(newState, nextAgentIndex, newDepth, action)[0], action))
          return v

        def expValue(state, agentIndex, depth):
          # print 'min agent...', agentIndex
          v = 0, None
          actions = state.getLegalActions(agentIndex)
          p = 1.0 / len(actions)
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = v[0] + (p * value(newState, nextAgentIndex, newDepth, action)[0]), action
          return v

        def value(state, agentIndex, depth=0, action=None): 
          # print 'agent', agentIndex, 'depth', depth
          if depth == self.depth or state.isLose() or state.isWin(): 
            utility = self.evaluationFunction(state), action
            # print 'utility:', utility
            # print
            return utility
          elif agentIndex == 0:
            return maxValue(state, agentIndex, depth)
          else:
            return expValue(state, agentIndex, depth)

        result = value(gameState, self.index)[1]
        return result
            
class ContestAgent2(MultiAgentSearchAgent):
    """
      Your agent for the mini-contest
    """
    startNumFood = None  

    def getAction(self, gameState):
        """
          Returns an action.  You can use any method you want and search to any depth you want.
          Just remember that the mini-contest is timed, so you have to trade off speed and computation.

          Ghosts don't behave randomly anymore, but they aren't perfect either -- they'll usually
          just make a beeline straight towards Pacman (or away from him if they're scared!)
        """
        "*** YOUR CODE HERE ***"
        self.depth = 3
        
        numAgents = gameState.getNumAgents()

        # print 'index:', self.index, 'searchDepth:', self.depth, 'numAgents:', numAgents
        # print

        def maxValue(state, agentIndex, depth):
          # print
          # print 'max agent...', agentIndex
          v = float("-infinity"), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            option = value(newState, nextAgentIndex, newDepth, action)[0], action           
            #if depth == 0:
              #print 'option:', option
            v = max(v, option)
            
          return v

        def minValue(state, agentIndex, depth):
          # print 'min agent...', agentIndex
          v = float('+infinity'), None
          actions = state.getLegalActions(agentIndex)
          # print 'actions:', actions
          for action in actions:
            # print 'action', action
            newState, nextAgentIndex, newDepth = self.createParams(state, agentIndex, depth, action)
            v = min(v, (value(newState, nextAgentIndex, newDepth, action)[0], action))
          return v

        def value(state, agentIndex, depth=0, action=None): 
          # print 'agent', agentIndex, 'depth', depth
          if depth == self.depth or state.isLose() or state.isWin(): 
            utility = better(state), action
            # print 'utility:', utility
            # print
            return utility
          elif agentIndex == 0:
            return maxValue(state, agentIndex, depth)
          else:
            return minValue(state, agentIndex, depth)

        value = value(gameState, self.index)
        result = value[1]
        #print 'choice:', value
        #print
        #util.pause()
        return result
            
