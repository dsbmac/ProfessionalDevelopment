def BFS(graph, start, end, q = []):
    initPath = [start]
    q.append(initPath)
    while len(q) != 0:
        tmpPath = q.pop(0)
        lastNode = tmpPath[len(tmpPath) - 1]
        if lastNode.label == end.label:
            return tmpPath
        for node in graph.childrenOf(lastNode):
            if notInPath(node, tmpPath):
                newPath = tmpPath + [node]
                q.append(newPath)
    return None


def DFS(graph, start, end, stack = []):
    initPath = [start]
    stack.insert(0, initPath)  ## note difference from BFS
    while len(stack) != 0:
        tmpPath = stack.pop(0)
        lastNode = tmpPath[len(tmpPath) - 1]
        if lastNode.label == end.label:
            return tmpPath
        for node in graph.childrenOf(lastNode):
            if notInPath(node, tmpPath):
                newPath = tmpPath + [node]
                stack.insert(0,newPath)  ## note difference
    return None
