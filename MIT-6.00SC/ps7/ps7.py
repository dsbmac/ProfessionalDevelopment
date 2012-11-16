# Problem Set 7: Simulating the Spread of Disease and Virus Population Dynamics 
# Name:
# Collaborators:
# Time:

import numpy
import random
import pylab

''' 
Begin helper code
'''

class NoChildException(Exception):
    """
    NoChildException is raised by the reproduce() method in the SimpleVirus
    and ResistantVirus classes to indicate that a virus particle does not
    reproduce. You can use NoChildException as is, you do not need to
    modify/add any code.
    """

'''
End helper code
'''

#
# PROBLEM 1
#
class SimpleVirus(object):

    """
    Representation of a simple virus (does not model drug effects/resistance).
    """
    def __init__(self, maxBirthProb, clearProb):

        """
        Initialize a SimpleVirus instance, saves all parameters as attributes
        of the instance.        
        maxBirthProb: Maximum reproduction probability (a float between 0-1)        
        clearProb: Maximum clearance probability (a float between 0-1).
        """
        self.maxBirthProb = maxBirthProb
        self.clearProb = clearProb

    def doesClear(self):

        """ Stochastically determines whether this virus particle is cleared from the
        patient's body at a time step. 
        returns: True with probability self.clearProb and otherwise returns
        False.
        """        
        return random.random() <= self.clearProb
            
    def reproduce(self, popDensity):

        """
        Stochastically determines whether this virus particle reproduces at a
        time step. Called by the update() method in the SimplePatient and
        Patient classes. The virus particle reproduces with probability
        self.maxBirthProb * (1 - popDensity).
        
        If this virus particle reproduces, then reproduce() creates and returns
        the instance of the offspring SimpleVirus (which has the same
        maxBirthProb and clearProb values as its parent).         

        popDensity: the population density (a float), defined as the current
        virus population divided by the maximum population.         
        
        returns: a new instance of the SimpleVirus class representing the
        offspring of this virus particle. The child should have the same
        maxBirthProb and clearProb values as this virus. Raises a
        NoChildException if this virus particle does not reproduce.               
        """
        
        reproProb = self.maxBirthProb * (1 - popDensity)

        if random.random() <= reproProb:
            return SimpleVirus(self.maxBirthProb, self.clearProb)
        else:
            raise NoChildException()

class SimplePatient(object):

    """
    Representation of a simplified patient. The patient does not take any drugs
    and his/her virus populations have no drug resistance.
    """    

    def __init__(self, viruses, maxPop):

        """

        Initialization function, saves the viruses and maxPop parameters as
        attributes.

        viruses: the list representing the virus population (a list of
        SimpleVirus instances)

        maxPop: the  maximum virus population for this patient (an integer)
        """
        self.viruses = viruses
        self.maxPop = maxPop
        self.popDensity = len(viruses) / maxPop

    def getTotalPop(self):
        """
        Gets the current total virus population. 
        returns: The total virus population (an integer)
        """
        result = len(self.viruses)
        return result

    def update(self):

        """
        Update the state of the virus population in this patient for a single
        time step. update() should execute the following steps in this order:
        
        - Determine whether each virus particle survives and updates the list
        of virus particles accordingly.   
        - The current population density is calculated. This population density
          value is used until the next call to update() 
        - Determine whether each virus particle should reproduce and add
          offspring virus particles to the list of viruses in this patient.                    

        returns: The total virus population at the end of the update (an
        integer)
        """        
        self.viruses = clearViruses(self.viruses)
        self.popDensity = float( self.getTotalPop() ) / self.maxPop
        self.viruses = newReproductionList(self.viruses, self.popDensity)
        
        return self.getTotalPop

def clearViruses(viruses):
    result = []
    for v in viruses:
        if not v.doesClear():
            result.append(v)
            
    return result
    
    
def newReproductionList(viruses, popDensity):
    result = []
    for v in viruses:
        result.append(v)
        try:
            newVirus = v.reproduce(popDensity)
            result.append(newVirus)
        except Exception:
            pass
        
    return result                 
   
#
# PROBLEM 2
#

def simulationWithoutDrug():

    """
    Run the simulation and plot the graph for problem 2 (no drugs are used,
    viruses do not have any drug resistance).    
    Instantiates a patient, runs a simulation for 300 timesteps, and plots the
    total virus population as a function of time.    
    """
    result = []
    maxBirthProb = 0.99
    clearProb = 0.05
    virusInstances = 100    
    viruses = createVirusList(virusInstances, maxBirthProb, clearProb)
    maxPop = 1000        
    johnDoe = SimplePatient(viruses, maxPop)

    timeSteps = 300

    for i in range(timeSteps):
        viruses = johnDoe.update()
        result.append(johnDoe.getTotalPop())
        
    return result

def displayWDSim(simResults):
    timeStep = range(300)
    pylab.plot(timeStep, simResults, label = 'Simulation')
    pylab.xlabel("Time Step")
    pylab.ylabel("Number of Viruses")
    pylab.title("Simulation Without Drug")

def createVirusList(n, maxBirthProb, clearProb):
    result = []
    for i in range(100):
        v = SimpleVirus(maxBirthProb, clearProb)
        result.append(v)
        
    return result
    
simResults = simulationWithoutDrug()
displayWDSim(simResults)
pylab.show()
