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

    return f(goalState, [])

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
    addArgs = isinstance(fringe, util.PriorityQueue) and not isinstance(fringe, util.PriorityQueueWithFunction)
    closed = {}    
    args = [(problem.getStartState(), None, None)]
    if addArgs: args.append(0)
    fringe.push(*args)

    #loop through the fringe, popping until finding the goal state
    while not fringe.isEmpty():

        currentNode = fringe.pop()
#        print "currentNode:", currentNode
        state = currentNode[0]

        if not state in closed:
            closed[state] = currentNode[1], currentNode[2]

            if problem.isGoalState(state):
 #               print "goal found!:", currentNode                
                return state, closed
            
            successors = problem.getSuccessors(state)
            for successor in successors:
                childNode = (successor[0], state, successor[1])
                args = [childNode]
                priority = closed[state] + successor[2]
                if addArgs: args.append(successor[2])
                fringe.push(*args)

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

    goalState, closed = genericSearch(problem, util.Stack())
    actions = goalActions(goalState, closed)       
    return actions

def breadthFirstSearch(problem):
    """
    Search the shallowest nodes in the search tree first.
    """

    goalState, closed = genericSearch(problem, util.Queue())
    actions = goalActions(goalState, closed)       
    return actions

def uniformCostSearch(problem):
    "Search the node of least total cost first. "
    goalState, closed = genericSearch(problem, util.PriorityQueue())
    actions = goalActions(goalState, closed)       
    print actions
    return actions

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    "Search the node that has the lowest combined cost and heuristic first."
    goalState, closed = genericSearch(problem, util.PriorityQueueWithFunction(heuristic))
    actions = goalActions(goalState, closed)       
    return actions

# Abbreviations
ts = testSearch
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
