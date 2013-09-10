import random, pylab
##xVals = []
##yVals = []
##wVals = []
##for i in range(1000):
##    xVals.append(random.random())
##    yVals.append(random.random())
##    wVals.append(random.random())
##xVals = pylab.array(xVals)
##yVals = pylab.array(yVals)
##wVals = pylab.array(wVals)
##xVals = xVals + xVals
##zVals = xVals + yVals
##tVals = xVals + yVals + wVals
##
####pylab.scatter(tVals, yVals)
#####pylab.plot(xVals, yVals)
#####pylab.plot(xVals, zVals)
#####pylab.plot(sorted(xVals), yVals)
#####pylab.plot(xVals, sorted(yVals))
#####pylab.plot(sorted(xVals), sorted(yVals))
####pylab.show()
##
##
##class Person(object):
##    def __init__(self, name):
##        self.name = name
##    def __lt__(self, other):
##        return self.name < other.name
##    def __str__(self):
##        return self.name
##    def getName(self):
##        return self.name
##
##class edXPerson(Person):
##    nextIdNum = 0
##    def __init__(self, name):
##        Person.__init__(self, name)
##        self.idNum = edXPerson.nextIdNum
##        edXPerson.nextIdNum += 1
##    def getIdNum(self):
##        return self.idNum
##    def __lt__(self, other):
##        if isinstance(self, SelfLearner) and isinstance(other, SelfLearner):
##            return self.name < other.name
##        return self.idNum < other.idNum
##    
##    def isStudent(self):
##        return isinstance(self, Student)
##
##class Student(edXPerson):
##    pass
##
##class UniversityStudent(Student):
##    pass
##
##class SelfLearner(Student):
##    def __init__(self, name):
##        Student.__init__(self, name)
##        self.idNum = 0
##
##class Subject(object):
##    def __init__(self):
##        self.students = []
##
##    def addStudent(self, student):
##        if student in self.students:
##            raise ValueError('Duplicate student')
##        self.students.append(student)
##
##    def allStudents(self):
##        others = []
##        selfLearners = []
##        for student in self.students:
##            if isinstance(student, SelfLearner):
##                selfLearners.append(student)
##            else:
##                others.append(student)
##
##        others.sort(reverse=True)
##        selfLearners.sort(reverse=True)        
##        result = others + selfLearners
##        
##        while len(result) > 0:            
##            yield result.pop().name
##
##
##    def __str__(self):
##        return 'Subject with ' + str(len(self.students)) + ' students.'
##
##
##p1 = edXPerson('Fred Flintstone')
##p2 = UniversityStudent('Wilma Flintstone')
##p3 = Student('Betty Rubble')
##p4 = SelfLearner('Barney Rubble')
##p5 = SelfLearner('Dino')
##p = Person('Eric Grimson')
##
##def test():
##    sub = Subject()
##    sub.addStudent(p1)
##    sub.addStudent(p2)
##    sub.addStudent(p3)
##    sub.addStudent(p4)
##    sub.addStudent(p5)
##    for s in sub.allStudents():
##        print s 
##
##test()
def p5test():
    a = 1.0
    b = 2.0
    c = 4.0
    yVals = []
    xVals = range(-20, 20)
    for x in xVals:
        yVals.append(a*x**2 + b*x + c)
    yVals = 2*pylab.array(yVals)
    print yVals
    xVals = pylab.array(xVals)
    print xVals
    try:
        z = pylab.polyfit(xVals, yVals, 3)
        print z
    except:
        print 'fell to here'
        
def p5():
    a = 1.0
    b = 2.0
    c = 4.0
    yVals = []
    xVals = range(-20, 20)
    for x in xVals:
        yVals.append(a*x**2 + b*x + c)
    yVals = 2*pylab.array(yVals)
    xVals = pylab.array(xVals)
    pylab.plot(xVals, yVals,'bo')
    try:        
        a, b, c, d = pylab.polyfit(xVals, yVals, 3)
        print a, b, c, d
        estYVals = a*(xVals**3) + b*xVals**2 + c*xVals + d
        pylab.plot(xVals, estYVals, label = 'Cubic fit')
        pylab.legend(loc = 'best')
        pylab.show()
    except:
        print 'fell to here'

p5()
    
##print '1', p2 < p3
##print '2', p2.getIdNum() < p3.getIdNum()
##print '3', p2.name < p3.name
##print '4',p4 < p3
##print '5',p4 < p5
##print '6',p1.isStudent()
##print '7',p3.isStudent()
##print '8',p5.isStudent()
##print '9',p.isStudent()
