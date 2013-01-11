# 6.00 Problem Set 10
# Graph optimization
#
# A set of data structures to represent graphs
#

class Node(object):
    def __init__(self, name):
        self.name = str(name)
    def getName(self):
        return self.name
    def __str__(self):
        return self.name
    def __repr__(self):
        return self.name
    def __eq__(self, other):
        return self.name == other.name
    def __ne__(self, other):
        return not self.__eq__(other)

class Edge(object):
    def __init__(self, src, dest):
        self.src = src
        self.dest = dest        
    def getSource(self):
        return self.src
    def getDestination(self):
        return self.dest
    def __str__(self):
        return '%s->%s' % (str(self.src), str(self.dest))

class Digraph(object):
    """
    A directed graph
    """
    def __init__(self):
        self.nodes = set([])
        self.edges = {}
    def addNode(self, node):
        if node in self.nodes:
            raise ValueError('Duplicate node')
        else:
            self.nodes.add(node)
            self.edges[node] = []
    def addEdge(self, edge):
        src = edge.getSource()
        dest = edge.getDestination()
        if not(src in self.nodes and dest in self.nodes):
            raise ValueError('Node not in graph')
        self.edges[src].append(dest)
    def childrenOf(self, node):
        return self.edges[node]
    def hasNode(self, node):
        return node in self.nodes
    def __str__(self):
        res = ''
        for k in self.edges:
            for d in self.edges[str(k)]:
                res = '%s%s->%s\n' % (res, str(k), str(d))
        return res[:-1]

class WeightedEdge(Edge):
    def __init__(self, src, dest, distance, distanceOutdoors):
        self.src = src
        self.dest = dest
        self.distance = distance
        self.distanceOutdoors = distanceOutdoors
    def getDistance(self):
        return self.distance
    def getDistanceOutdoors(self):
        return self.distanceOutdoors
    def __str__(self):
        return '%s->%s (%s, %s)'  % (str(self.src), str(self.dest),
            str(self.distance), str(self.distanceOutdoors))

class WeightedDigraph(Digraph):
    def __str__(self):
        res = ''
        for k in self.edges.keys():
            res += k      
            
                #res = '%s%s->%s\n' % (res, str(k), str(d))
        return res
    def addNode(self, node):
        if node in self.nodes:
            raise ValueError('Duplicate node')
        else:
            self.nodes.add(node)            
            self.edges[node] = {}
    def addWeightedEdge(self, edge):            
        src = edge.getSource()
        dest = edge.getDestination()
        distance = edge.getDistance()
        distanceOutdoors = edge.getDistanceOutdoors()
        if not(src in self.nodes and dest in self.nodes):
            raise ValueError('Node not in graph')
        info = {'dest':dest, 'distance':distance, 'distanceOutdoors':distanceOutdoors}
        self.edges[src] = info