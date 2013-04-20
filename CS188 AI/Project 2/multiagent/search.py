# search.py
# ---------
# Licensing Information: Please do not distribute or publish solutions to this
# project. You are free to use and extend these projects for educational
# purposes. The Pacman AI projects were developed at UC Berkeley, primarily by
# John DeNero (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and Pieter 
# Abbeel in Spring 2013.
# For more info, see http://inst.eecs.berkeley.edu/~cs188/pacman/pacman.html

"""
In search.py, you will implement generic search algorithms which are called
by Pacman agents (in searchAgents.py).
"""

import util

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples,
        (successor, action, stepCost), where 'successor' is a
        successor to the current state, 'action' is the action
        required to get there, and 'stepCost' is the incremental
        cost of expanding to that successor
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.  The sequence must
        be composed of legal moves
        """
        util.raiseNotDefined()

def goalActions(goalState, closed):
    def f(state, actions=[]):
        next = closed[state][0]
        if next == None: return actions
        action = closed[state][1]
        actions.insert(0, action)        
        return f(next, actions)
    result = f(goalState, [])
    return result

def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other
    maze, the sequence of moves will be incorrect, so only use this for tinyMaze
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s,s,w,s,w,w,s,w]

def testSearch(problem):
    print "Start:", problem.getStartState()
    #print "Is the start a goal?", problem.isGoalState(problem.getStartState())
    print "Start's successors:", problem.getSuccessors(problem.getStartState())
    #box = util.PriorityQueueWithFunction(nullHeuristic)
    box = util.PriorityQueue()
    print 'type:', type(box)
    print 'isinstance:', isinstance(box, util.PriorityQueue) and not isinstance(box, util.PriorityQueueWithFunction)
    util.raiseNotDefined()

def genericSearch(problem, fringe):
    addPriority = isinstance(fringe, util.PriorityQueue) and not isinstance(fringe, util.PriorityQueueWithFunction)

    def pusher(node):
        if addPriority:
            priority = node[-1]
            fringe.push(node, priority)
        else:            
            fringe.push(node)

    closed = {}    
    #fringe node format: state, parent, action, cost
    startNode = (problem.getStartState(), None, None, 0)
    pusher(startNode)

    #loop through the fringe, popping until finding the goal state
    while not fringe.isEmpty():
        #print 'closed', closed
        currentNode = fringe.pop()
        #print "currentNode:", currentNode
        state = currentNode[0]
 
        if not state in closed:
            closed[state] = tuple(currentNode[1:-1])

            if problem.isGoalState(state):
 #               print "goal found!:", currentNode                
                return goalActions(state, closed)      
            
            #expand the fringe
            successors = problem.getSuccessors(state)
            for successor in successors:
                cost = currentNode[-1] + successor[-1]
                node = successor[0], state, successor[1], cost
                pusher(node)

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first

    Your search algorithm needs to return a list of actions that reaches
    the goal.  Make sure to implement a graph search algorithm

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print "Start:", problem.getStartState()
    print "Is the start a goal?", problem.isGoalState(problem.getStartState())
    print "Start's successors:", problem.getSuccessors(problem.getStartState())
    """

    return genericSearch(problem, util.Stack())

def breadthFirstSearch(problem):
    """
    Search the shallowest nodes in the search tree first.
    """

    return genericSearch(problem, util.Queue())

def uniformCostSearch(problem):
    "Search the node of least total cost first. "

    return genericSearch(problem, util.PriorityQueue())

def nullHeuristic(state, problem=None): 
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    "Search the node that has the lowest combined cost and heuristic first."

    def fn(currentNode):
        state = currentNode[0]
        cost = currentNode[-1]
        priority = cost + heuristic(state, problem)
        #print 'cost', cost
        #print 'priority', priority
        return priority

    return genericSearch(problem, util.PriorityQueueWithFunction(fn))

# Abbreviations
ts = testSearch
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
