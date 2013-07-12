import random
import pylab


def sampleQuizzes():
    """
    Midterm 1: 50 <= grade <= 80

    Midterm 2: 60 <= grade <= 90

    Final Exam: 55 <= grade <= 95
    """
    gradeRanges = ((50, 80), (60, 90), (55, 95))
    weight = (0.25, 0.25, 0.5)

    numTrials = 10000
    finalGrades = []
    hits = 0.0
    
    for i in range(numTrials):
        marks = []
        for j in range(len(gradeRanges)):            
            gr = gradeRanges[j]
            a = gr[0]
            b = gr[1]
            mark = random.randint(a,b)
            weightedMark =  weight[j] * mark
            #print j, mark, weight[j], weightedMark            
            marks.append(weightedMark)
        #print marks
        finalGrade = sum(marks)
        #print 'final', finalGrade        
        finalGrades.append(finalGrade)
        if 70 <= finalGrade <= 75:
            hits +=1
    return hits / numTrials, finalGrades
    

#7-2
def graph():
    numTrials = 10000
    grades = generateScores(numTrials)
    pylab.hist(grades, 7)
    pylab.title('Distribution of Scores')
    pylab.xlabel('Final Score')
    pylab.ylabel('Number of Trials')    
    pylab.show()

graph()
