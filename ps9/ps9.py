# 6.00 Problem Set 9
#
# Intelligent Course Advisor
#
# Name:
# Collaborators:
# Time:
#

import itertools

SUBJECT_FILENAME = "subjects.txt"
SHORT_SUBJECT_FILENAME = "shortened_subjects.txt"
VALUE, WORK = 0, 1

#
# Problem 1: Building A Subject Dictionary
#
def loadSubjects(filename):
    """
    Returns a dictionary mapping subject name to (value, work), where the name
    is a string and the value and work are integers. The subject information is
    read from the file named by the string filename. Each line of the file
    contains a string of the form "name,value,work".

    returns: dictionary mapping subject name to (value, work)
    """
    inputFile = open(filename)
    subjects = dict()
    
    for line in inputFile:
        parse =  [item.strip() for item in line.split(',')]
        subjects[parse[0]] = int(parse[1]), int(parse[2])

    return subjects

def printSubjects(subjects):
    """
    Prints a string containing name, value, and work of each subject in
    the dictionary of subjects and total value and work of all subjects
    """
    totalVal, totalWork = 0,0
    if len(subjects) == 0:
        return 'Empty SubjectList'
    res = 'Course\tValue\tWork\n======\t====\t=====\n'
    subNames = subjects.keys()
    subNames.sort()
    for s in subNames:
        val = subjects[s][VALUE]
        work = subjects[s][WORK]
        res = res + s + '\t' + str(val) + '\t' + str(work) + '\n'
        totalVal += val
        totalWork += work
    res = res + '\nTotal Value:\t' + str(totalVal) +'\n'
    res = res + 'Total Work:\t' + str(totalWork) + '\n'
    print res

#
# Problem 2: Subject Selection By Greedy Optimization
#

def cmpValue(subInfo1, subInfo2):
    """
    Returns True if value in (value, work) tuple subInfo1 is GREATER than
    value in (value, work) tuple in subInfo2
    """
    return subInfo1[VALUE] > subInfo2[VALUE]

def cmpWork(subInfo1, subInfo2):
    """
    Returns True if work in (value, work) tuple subInfo1 is LESS than than work
    in (value, work) tuple in subInfo2
    """
    return subInfo1[WORK] < subInfo2[WORK]

def cmpRatio(subInfo1, subInfo2):
    """
    Returns True if value/work in (value, work) tuple subInfo1 is 
    GREATER than value/work in (value, work) tuple in subInfo2
    """
    return ( float(subInfo1[VALUE]) / subInfo1[WORK] ) > ( float(subInfo2[VALUE]) / subInfo2[WORK] )

def greedyAdvisor(subjects, maxWork, comparator):
    """
    Returns a dictionary mapping subject name to (value, work) which includes
    subjects selected by the algorithm, such that the total work of subjects in
    the dictionary is not greater than maxWork.  The subjects are chosen using
    a greedy algorithm.  The subjects dictionary should not be mutated.

    subjects: dictionary mapping subject name to (value, work)
    maxWork: int >= 0
    comparator: function taking two tuples and returning a bool
    returns: dictionary mapping subject name to (value, work)
    """
    assert type(subjects) == dict and maxWork >= 0
    sortParams = getSortParams(comparator)
    subjectsCopy = sorted( subjects.items(), key=sortParams[0], reverse = sortParams[1])
    totalWork = 0
    result = {}
    i = 0
    while totalWork < maxWork and i < len(subjectsCopy):
        if subjectsCopy[i][1][WORK] + totalWork <= maxWork:
            result[ subjectsCopy[i][0] ] =   subjectsCopy[i][1]
            totalWork += subjectsCopy[i][1][WORK]            
        i +=1
    return result

def getSortParams(comparator):
    if comparator == cmpWork:
        return getWork, False
    elif comparator == cmpValue:
        return getValue, True
    elif comparator == cmpRatio:
        return getRatio, True 
    else:
        return '',''

def getWork(item):
    return item[1][WORK]
def getValue(item):
    return item[1][VALUE]
def getRatio(item):
    return float(item[1][VALUE]) / item[1][WORK]

def bestGreedy(subjects, maxWork, comparator):
    result = {}
    sumWork = 0
    subjectList = [x for x in subjects.items()  if ( x[1][WORK] + sumWork )<= maxWork ]
    while True:    
        if len( subjectList ) == 0: break
        best = ()
        for subject in subjectList:
            if best == () or comparator(subject[1], best[1] ) :
                best = subject
        result[best[0]] = best[1]
        subjectList.remove(best)
        sumWork += best[1][WORK]
        subjectList = [x for x in subjectList  if ( x[1][WORK] + sumWork ) <= maxWork ]
        
    return result

#
# Problem 3: Subject Selection By Brute Force
#
def bruteForceAdvisor(subjects, maxWork):
    """
    Returns a dictionary mapping subject name to (value, work), which
    represents the globally optimal selection of subjects using a brute force
    algorithm.

    subjects: dictionary mapping subject name to (value, work)
    maxWork: int >= 0
    returns: dictionary mapping subject name to (value, work)
    """
    assert type(subjects) == dict and maxWork >= 0
    subjectsKeys = subjects.keys()
    totalWork = 0
    result = {}

    uniqueCombos = permutations(subjectKeys)
    for combo in uniqueCombos:
      comboTotals = sumCombo(combo)
      if comboTotals[WORK]<= maxWork:
        result[comboSorted] = comboTotals[VALUE], comboTotals[WORK]    
    return result

def permutations(inputValues, result=[]):
    newPerms = []

    if inputValues == []:
        print 'no more input values'
        print 'result:', result
        assert result != None
        return result
    else:
        i = [inputValues.pop()]
        if i not in result:
            newPerms.append(i)
        for perm in result:
            newPerm = sorted(perm + i)
            if newPerm not in result:
                newPerms.append(newPerm)
        result = result + newPerms
        permutations(inputValues, result)
             

def sumCombo(comboSorted, subjects):
  valueSum, workSum = 0
  for subject in comboSorted:
    valueSum += subjects[subject][VALUE]
    workSum += subjects[subject][WORK]
  return valueSum, workSum
  
def test():
    subjects = loadSubjects("smallCatalog.txt")
##    subjects = loadSubjects(SUBJECT_FILENAME)
##    print greedyAdvisor( subjects, 15, cmpWork)
##    print bruteForceAdvisor(subjects, 15)
    subjectsList = subjects.keys()
    print permutations([1,2,3,4])
test()
