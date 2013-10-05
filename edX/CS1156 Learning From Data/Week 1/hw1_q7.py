complete_D = []
H= []

# initialize data 
def init():
    init_complete_D()
    init_H()
    
# initialize data into complete_D    
def init_complete_D():                
    for i in range(2):
        for j in range(2):
            for k in range(2):
                complete_D.append((i,j,k))

# create all possible solutions for H
def init_H():
    def rec_fill(data, solution):
        if len(solution) == len(complete_D):
            H.append(solution)
        else:

            # branch two new solutions with either 0,1 value for next data point
            for i in range(2):
                newSolution = dict(solution)
                newSolution[data[0]] = i
                rec_fill(data[1:], newSolution)
    rec_fill(complete_D[:], {})

# filter solutions to match the 5 data points in D
def filter_H():
    result = []
    for solution in H:
        if not solution[(0,0,0)] and \
           solution[(0,0,1)] and \
           solution[(0,1,0)] and \
           not solution[(0,1,1)] and \
           solution[(1,0,0)]:
            result.append(solution)
    return result

def score(examples):
    results = {'a':[], 'b':[], 'c':[], 'd':[], 'e':[]}
    cAnswerKey = (0,0,1)
    dAnswerKey = (1,1,0)
    for example in examples:
        ys = (example[(1,0,1)], example[(1,1,0)], example[(1,1,1)])
        total = sum(ys)

        # a: g returns 1 for all three points
        results['a'].append(ys.count(1))

        # b: g returns 0 for all three points
        results['b'].append(ys.count(0))

        # c: g is XOR
        # d: g is not XOR
        cResult = 0
        dResult = 0
        for i in range(len(ys)):
            if ys[i] == cAnswerKey[i]: cResult += 1
            if ys[i] == dAnswerKey[i]: dResult += 1
        results['c'].append(cResult)
        results['d'].append(dResult)
        
        # e: a through d are equal

    scores = {'a':0, 'b':0, 'c':0, 'd':0, 'e':0}
    for k, v in results.iteritems():
        score = 0
        for x in v:
            if x == 3: score += 3*x
            if x == 2: score += 2*x
            if x == 1: score += 1*x
            if x == 0: score += 0*x
        scores[k] = score
    return scores
        

init()
outsideD = filter_H()
scores = score(outsideD)
