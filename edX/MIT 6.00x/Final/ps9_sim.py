import random

##def trial():
##    top = 100
##    students = 1000
##    countries = ['Africa', 'Europe', 'S.Am', 'Asia']
##    grades = []
##    for i in range(students):
##        c = random.choice(countries)
##        grade = random.random() * 100        
##        grades.append((c, grade))
##
##    sortedGrades = sorted(grades, key=lambda student: student[1], reverse=True)
##    #print sortedGrades[:top-1]
##
##    topStudents = [0, 0, 0, 0]
##    for i in range(top):
##        for j, c in enumerate(countries):
##            if sortedGrades[i][0] == c:
##                topStudents[j] += 1
##    #print topStudents
##    if (sum(topStudents) >= 30) > 0:
##        return 1
##    else:
##        return 0

def trial():
    top = 100
    nStudents = 250
    countries = ['Africa', 'Europe', 'S.Am', 'Asia']
    students = []

    for j in countries:
        for i in range(nStudents):
            students.append(j)

    topStudents = []

    for i in range(top):
        index = random.randint(0, len(students)-1)
        topStudents.append(students.pop(index))

    results = [0, 0, 0, 0]
    for i in topStudents:
        results[countries.index(i)] += 1
    #print results
    
    if (max(results) >= 30) > 0:
        return 1
    else:
        return 0

def test(numTrials):
    """
    Uses simulation to compute and return an estimate of
    the probability of at least 30 of the top 100 grades
    coming from a single geographical area purely by chance
    """
    # Your Code Here
    hits = 0.0
    for i in range(numTrials):
        result = trial()
        #print result
        hits += result
    return hits / numTrials

print test(1000)
        
        
        
    
    
        
        
        
