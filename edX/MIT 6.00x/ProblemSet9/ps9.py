# 6.00 Problem Set 9

import numpy
import random
import pylab
from ps8b_precompiled_27 import *

#
# PROBLEM 1
#

def runSplitTrial(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, timeSteps):
    totalPop = 0
    viruses = []
    for i in range(numViruses):
        v = ResistantVirus(maxBirthProb, clearProb, resistances, mutProb)
        viruses.append(v)
        
    p = TreatedPatient(viruses, maxPop)
    for i in range(len(timeSteps)): #split the test in parts
#        print 'i:', i, timeSteps[i]
        for j in range(timeSteps[i]):
            totalPop = p.update()
#            print 'totalPop:', totalPop
        if i == 0:
            p.addPrescription('guttagonol')
#            print 'adding guttagonol', i
        elif len(timeSteps) > 2 and i == 1:
            p.addPrescription('grimpex')
#            print 'adding grimpex', i
                   
    return totalPop             
    
def simulationDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 1.

    Runs numTrials simulations to show the relationship between delayed
    treatment and patient outcome using a histogram.

    Histograms of final total virus populations are displayed for delays of 300,
    150, 75, 0 timesteps (followed by an additional 150 timesteps of
    simulation).

    numTrials: number of simulation runs to execute (an integer)
    """

    numViruses = 100
    maxPop = 1000
    maxBirthProb = 0.1
    clearProb = 0.05
    resistances = {'guttagonol': False}
    mutProb = 0.005        

    timeStepParams = [300, 150, 75, 0]
    for k, steps in enumerate(timeStepParams):
        results = []
        for i in range(numTrials):
            result = []
            timeSteps = [steps, 150]
            result = runSplitTrial(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                               mutProb, timeSteps)        
            results.append(result)            
        #print results
        pylab.subplot(len(timeStepParams), 1, k + 1)
        numBins = min(len(results), 10)
        pylab.hist(results, numBins)
        pylab.ylabel("Trials")        
    
    pylab.xlabel("Final Virus Population")
    pylab.show()   


    
def test():
    numTrials = 100
    simulationDelayedTreatment(numTrials)


#
# PROBLEM 2
#
def simulationTwoDrugsDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 2.

    Runs numTrials simulations to show the relationship between administration
    of multiple drugs and patient outcome.

    Histograms of final total virus populations are displayed for lag times of
    300, 150, 75, 0 timesteps between adding drugs (followed by an additional
    150 timesteps of simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    
    numViruses = 100
    maxPop = 1000
    maxBirthProb = 0.1
    clearProb = 0.05
    resistances = {'guttagonol': False, 'grimpex': False}
    mutProb = 0.005        

    timeStepParams = [300, 150, 75, 0]
    for k, steps in enumerate(timeStepParams):
        results = []
        for i in range(numTrials):
            result = []
            timeSteps = [150, steps, 150]
            result = runSplitTrial(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                               mutProb, timeSteps)        
            results.append(result)            
#        print results
        pylab.subplot(len(timeStepParams), 1, k + 1)
        numBins = min(len(results), 10)
        pylab.hist(results, numBins)
        pylab.ylabel("Trials")        
    
    pylab.xlabel("Final Virus Population")
    pylab.show()  

def test2():
    numTrials = 100
    simulationTwoDrugsDelayedTreatment(numTrials)

test2()
