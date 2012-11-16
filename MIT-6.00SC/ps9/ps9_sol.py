# 6.00 Problem Set 8
#
# Intelligent Course Advisor
#
# Name:
# Collaborators:
# Time:
#

import time
import pprint

pp = pprint.pprint

SUBJECT_FILENAME = "subjects.txt"
SHORT_SUBJECT_FILENAME = "shortened_subjects.txt"
SMALL = "subjects_sm.txt"
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

    # The following sample code reads lines from the specified file and prints
    # each one.
    inputFile = open(filename)
    d = {}
    for line in inputFile:
        L = line.rstrip().split(',')
        name = L.pop(0)
        value, work = map(int, L)
        d[name] = (value, work)
    print len(d), 'subjects'
    return d

    # TODO: Instead of printing each line, modify the above to parse the name,
    # value, and work of each subject and create a dictionary mapping the name
    # to the (value, work).

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

def cmpValue(subInfo1, subInfo2):
    """
    Returns True if value in (value, work) tuple subInfo1 is GREATER than
    value in (value, work) tuple in subInfo2
    """
    val1 = subInfo1[VALUE]
    val2 = subInfo2[VALUE]
    return  val1 > val2

def cmpWork(subInfo1, subInfo2):
    """
    Returns True if work in (value, work) tuple subInfo1 is LESS than than work
    in (value, work) tuple in subInfo2
    """
    work1 = subInfo1[WORK]
    work2 = subInfo2[WORK]
    return  work1 < work2

def cmpRatio(subInfo1, subInfo2):
    """
    Returns True if value/work in (value, work) tuple subInfo1 is 
    GREATER than value/work in (value, work) tuple in subInfo2
    """
    val1 = subInfo1[VALUE]
    val2 = subInfo2[VALUE]
    work1 = subInfo1[WORK]
    work2 = subInfo2[WORK]
    return float(val1) / work1 > float(val2) / work2

#
# Problem 2: Subject Selection By Greedy Optimization
#
# I think Greedy opt means that as you iterate through the choices
# you just pick the optimum choice at each step
# - then you go back and repeat as long as the constraint isn't exceeded
def greedyAdvisor(subjects, maxWork, comparator, best_d):
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
    # TODO...
    global numcalls
    numcalls += 1
    # best_v and best_k hold the best subject while traversing the dictionary
    # cmpValue and cmpRatio initial work value has to be small
    best_v = (1, 1)
    # cmpWork => initial work value has to be big
    if comparator.func_name == 'cmpWork':
        best_v = (1,10000000)
    best_k = ''
    # find the best subject in the dictionary with work less than maxWork 
    for k, v in subjects.iteritems():
        if comparator(v, best_v) and v[1] <= maxWork and k not in best_d:
            best_k = k
            best_v = v
    # base case for the recursion
    # if you didn't find a subject that fit the criteria
    # you are done
    if not best_k:
        return best_d.copy()
    else:
        # you found the best one so keep it
        best_d[best_k] = best_v
        # adjust maxWork - recurse greedyadvisor
        maxWork -= best_v[1]
        return greedyAdvisor(subjects, maxWork, comparator, best_d)

def test_greedy(n):
    """ n = maxWork."""
    for subjs in subjects_sm, subjects:
        print '******************************'
        for cmp_method in cmpValue, cmpWork, cmpRatio:
            fname = cmp_method.func_name
            d = {}
            start = time.clock()
##            winners = greedyAdvisor(subjs, n, cmp_method, d)
            winners = greedy_sort(subjs, n, cmp_method, d)
            elapsed = (time.clock() - start) * 1000
            #print '************************'
            print 'greedy %s took %9.4f mS' % (fname, elapsed)
            printSubjects(winners)

def greedy_sort(subjects, maxWork, comparator, best_d):
    subj_list = subjects.items()
    # sort the list --> 'best' first
    if comparator.__name__ ==  'cmpValue':
        subj_list.sort(key = lambda item: item[1][VALUE], reverse = True)
    if comparator.__name__ ==  'cmpWork':
        subj_list.sort(key = lambda item: item[1][WORK])
    if comparator.__name__ ==  'cmpRatio':
        subj_list.sort(key = lambda item: item[1][VALUE] / item[1][WORK],
                       reverse = True)
    best_subjects=[]
    for s in subj_list:
        if s[1][WORK] <= maxWork:
            best_subjects.append(s)
            maxWork -= s[1][WORK]
    return dict(best_subjects)

def test((cmp_method, subjs, n)):
    d = {}
    fname = cmp_method.func_name
    start = time.clock()
    winners = greedyAdvisor(subjs, n, cmp_method, d)
    elapsed = (time.clock() - start) * 1000
    #print '************************'
    print 'greedy %s took %9.4f mS' % (fname, elapsed)
    printSubjects(winners)
    return winners, elapsed

def tst_greedy(n):
    methods = cmpValue, cmpWork, cmpRatio
    s = (subjects_sm, subjects)
    return [test(cmp_method, subj, n) for cmp_method in methods for subj in s]
    
def bruteForceAdvisor(subjects, maxWork, helper):
    """
    Returns a dictionary mapping subject name to (value, work), which
    represents the globally optimal selection of subjects using a brute force
    algorithm.

    subjects: dictionary mapping subject name to (value, work)
    maxWork: int >= 0
    returns: dictionary mapping subject name to (value, work)
    """
    # splits the dictionary into two lists
    # - the knapsack example in lecture 13 used lists and
    #   kept track of 'items' with the list index
    # when you iterate through an unordered set (dictionary)
    # isn't the access order indeterminant?  how do the nameList
    # indices relate to the tupleList indices?
    nameList = subjects.keys()
    tupleList = subjects.values()
    bestSubset, bestSubsetValue = (bruteForceAdvisorHelper(subjects,
                                                           maxWork, 0,
                                                           None, None,
                                                           [], 0, 0)
                                   )
    # put the lists back in a dictionary - how is the index order maintained?
    outputSubjects = {}
    for i in bestSubset:
        outputSubjects[nameList[i]] = tupleList[i]
    return outputSubjects

def bruteForceAdvisorHelper(subjects, maxWork, i,
                            bestSubset, bestSubsetValue,
                            subset, subsetValue, subsetWork):
    # Hit the end of the list.
    global numcalls
    numcalls +=1
    if i >= len(subjects):
        if bestSubset == None or subsetValue > bestSubsetValue:
            # Found a new best.
            return subset[:], subsetValue
        else:
            # Keep the current best.
            return bestSubset, bestSubsetValue
    else:
        s = subjects[i]
        # Try including subjects[i] in the current working subset.
        # so  i wrote this but....
        # it looks like i have two branches here - a take and don't take
        # looks like at every node i create two paths
        # - this should find every possible combination
        # looks like i kludged, i had to pop an item off the stuff i kept
        # before going down the don't take branch 
        if subsetWork + s[WORK] <= maxWork:
            # take update, recurse to the next item
            subset.append(i)
            bestSubset, bestSubsetValue = (bruteForceAdvisorHelper
                                           (subjects, maxWork, i+1,
                                            bestSubset, bestSubsetValue,
                                            subset,
                                            subsetValue + s[VALUE],
                                            subsetWork + s[WORK]))
            subset.pop()
        # don't take, recurse to the next item
        bestSubset, bestSubsetValue = (bruteForceAdvisorHelper
                                       (subjects, maxWork, i+1,
                                        bestSubset, bestSubsetValue,
                                        subset, subsetValue, subsetWork))
        return bestSubset, bestSubsetValue


#
# Problem 3: Subject Selection By Brute Force
#
def bruteForceTime(maxWork, helper):
    """
    Runs tests on bruteForceAdvisor and measures the time required to compute
    an answer.
    """
    # TODO...
    subjs = subjects
    subjx = subjects_sm
    start = time.time()
    winners = bruteForceAdvisor(subjx, maxWork, helper)
    print "that took %5.2f seconds" % (time.time() - start)
    printSubjects(winners)
    

# Problem 3 Observations
# ======================
#
# TODO: write here your observations regarding bruteForceTime's performance


#
# Problem 4: Subject Selection By Dynamic Programming
#

# miscellaneous helper functions for dpAdvisor and dpAdvisorHelper
def to_lists(subjects):
    """
    reduce the dictionary to a tuple of lists
    'names':(values, works) -->> ['name'], [values], [works]
    """
    # is there a better way to do this?
    subjx = subjects.keys()
    vlist = subjects.values()
    tmp = zip(*vlist)
    values = list(tmp[0])
    works = list(tmp[1])
    return subjx, values, works

def branch_value(branch, value):
    """
    branch is a list of indices taken
    value is the list of subject values from the dictionary
    """
    total = 0
    for i in branch:
        total += value[i]
    return total
##    return sum([value[i] for i in branch])

# In lecture 13 the brute force code was converted to a
# Dynamic Program algorithm by addition of memoization steps
# the brute force and DP algorithms both used lists

def dpAdvisor(subjects, maxWork):
    """
    Returns a dictionary mapping subject name to (value, work) that contains a
    set of subjects that provides the maximum value without exceeding maxWork.

    subjects: dictionary mapping subject name to (value, work)
    maxWork: int >= 0
    returns: dictionary mapping subject name to (value, work)
    """
    result = {}
    # turn the dictionary into lists for dpAdvisorHelper
    subjx, value, work = to_lists(subjects)
    # winners should be the list of indices of the optimal solution
    winners = dpAdvisorHelper(work, value, len(value) - 1, maxWork, {})
    # turn winners into dictionary of name:(v,w)
    for i in winners:
        result[subjx[i]] = (value[i], work[i])
    return result

# this problem is exactly like the knapsack problem
# but this solution needs to keep track of the items taken
# made my own decision tree to try and figure this out
# this is an adaptation of the findMaxVal function from the lecture
def dpAdvisorHelper(work, value, i, work_avail, memo):
    global numcalls 
    numcalls += 1
    # the next two lists will gather up the indices
    dont_take = []
    take = []

    # see if it is in the memo
    try:
        return memo[(i, work_avail)]
    except KeyError:
        pass

    # base case for recursion
    if i == 0:
        if work[i] <= work_avail:
            # in this adaptation we care about (need to preserve)
            # the actual indices that are chosen
            # I could only figure out how to make it work with lists
            # so return a list with one element (the index)
            memo[(i, work_avail)] = [i]
            return [i]
        else:
            return []
##            # will have to strip these None's out later
##            memo[(i, work_avail)] = [None]
##            return [None]

    # going left-first depth-first
    # work_avail doesn't change on dont_takes
    dont_take.extend(dpAdvisorHelper
                     (work, value, i-1, work_avail, memo))

    # must have gotten to the bottom of a dont_take recursion
    # going up to the previous node to start taking - going right
    if work[i] > work_avail:
        memo[(i, work_avail)] = dont_take
        return dont_take
    else:
        # going right and down, work_avail changes
        # take this one and recurse
        take.extend([i])
        take.extend(dpAdvisorHelper
                    (work, value, i-1, work_avail - work[i], memo))

    # if there are any None's in the lists get rid of them
    # they are an artifact of not knowing what else to do in
    # the recursion base case above
##    while None in dont_take:
##        dont_take.remove(None)
##    while None in take:
##        take.remove(None)

    # compare the take and dont_take branches
    if branch_value(take, value) >= branch_value(dont_take, value):
        winners = take
        memo[(i, work_avail)] = take
##        print "******** take branch ***********"
##        pp(take)
##        print "****** memo *********"
##        pp(memo)
    else:
        winners = dont_take
        memo[(i, work_avail)] = dont_take
##        print "******** dont_take branch ***********"
##        pp(dont_take)
##        print "****** memo *********"
##        pp(memo)

    # well it looks like it gets here multiple times
    # i thought this would only happen once in the top
    # top level recursion - so i guess i don't completely
    # understand it yet.  even though it works :)
    # need to figure out where in the decision tree this is
##    print "**** final memo *** returning winners ****"
##    pp(memo)
    return winners
        
def test_dpAdvisor(maxWork):
    global numcalls
    # the correct answer for the test dictionary
    # {'a':(10,2), 'b':(2,3), 'c':(5,9), 'd':(8,4)}
    # with a work constraint of 15 is keys a, c and d
    # total value = 23 and total work = 15
    start = time.clock()
    winners = dpAdvisor(test, 15)
    interval = (time.clock() - start) * 1000
    print 'test  (  4) dictionary work = 15 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects_sm, 15)
    interval = (time.clock() - start) * 1000
    print 'small ( 20) dictionary work = 15 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 5)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work =  5 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 10)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work = 10 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 15)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work = 15 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 20)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work = 20 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 30)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work = 30 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)
    numcalls = 0
    start = time.clock()
    winners = dpAdvisor(subjects, 40)
    interval = (time.clock() - start) * 1000
    print 'large (320) dictionary work = 40 numcalls: %6i  time: %7.3f mSec' % (numcalls, interval)
    #printSubjects(winners)

#
# Problem 5: Performance Comparison
#
def dpTime():
    """
    Runs tests on dpAdvisor and measures the time required to compute an
    answer.
    """
    # TODO...

# Problem 5 Observations
# ======================
#
# TODO: write here your observations regarding dpAdvisor's performance and
# how its performance compares to that of bruteForceAdvisor.

##if __name__ == '__main__':
##    print 'main!'
##    subjects = loadSubjects(SUBJECT_FILENAME)
##    test = {'a':(10,2), 'b':(2,3), 'c':(5,9), 'd':(8,4)}
##
##    subjects_sm = {'2.10': (6, 12), '2.14': (8, 19), '2.11': (9, 19),
##                   '2.13': (5, 20), '2.18': (6, 16), '2.15': (9, 19),
##                   '2.12': (10, 4), '2.17': (10, 20), '2.08': (5, 5),
##                   '2.09': (5, 2), '2.19': (6, 19), '2.16': (9, 20),
##                   '2.04': (3, 2), '2.05': (2, 2), '2.06': (2, 1),
##                   '2.07': (1, 1), '2.00': (5, 9), '2.01': (2, 2),
##                   '2.02': (1, 17), '2.03': (6, 1)}
##    numcalls = 0
    
def test():
    subjects = loadSubjects(SHORT_SUBJECT_FILENAME)
    print bruteForceAdvisor(subject, 3)
    
