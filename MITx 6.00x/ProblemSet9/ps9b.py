# Problem Set 8: Simulating the Spread of Disease and Virus Population Dynamics 

#import numpy
import random
import pylab
#from ps8b_precompiled_27 import *  

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
# PROBLEM 2
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

    def getMaxBirthProb(self):
        """
        Returns the max birth probability.
        """
        return self.maxBirthProb 
        

    def getClearProb(self):
        """
        Returns the clear probability.
        """
        return self.clearProb

    def doesClear(self):
        """ Stochastically determines whether this virus particle is cleared from the
        patient's body at a time step. 
        returns: True with probability self.getClearProb and otherwise returns
        False.
        """        
        x = random.random()
##        print 'random, clearProb, bool:', x, self.clearProb, x <= self.clearProb
        return x <= self.clearProb 
    
    def reproduce(self, popDensity):
        """
        Stochastically determines whether this virus particle reproduces at a
        time step. Called by the update() method in the Patient and
        TreatedPatient classes. The virus particle reproduces with probability
        self.getMaxBirthProb * (1 - popDensity).
        
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

        pReproduce = self.maxBirthProb * (1 - popDensity)
        x = random.random()
##        print 'x, pReproduce, bool:', x, pReproduce, x <= pReproduce
        
        if x <= pReproduce:            
            newVirus = SimpleVirus(self.maxBirthProb, self.clearProb)
            return newVirus
        else:
            raise NoChildException(Exception)
            

class Patient(object):
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

        maxPop: the maximum virus population for this patient (an integer)
        """

        self.viruses = viruses
        self.maxPop = maxPop

    def getViruses(self):
        """
        Returns the viruses in this Patient.
        """
        return self.viruses


    def getMaxPop(self):
        """
        Returns the max population.
        """
        return self.maxPop


    def getTotalPop(self):
        """
        Gets the size of the current total virus population. 
        returns: The total virus population (an integer)
        """

        return len(self.viruses)  


    def update(self):
        """
        Update the state of the virus population in this patient for a single
        time step. update() should execute the following steps in this order:
        
        - Determine whether each virus particle survives and updates the list
        of virus particles accordingly.   
        
        - The current population density is calculated. This population density
          value is used until the next call to update() 
        
        - Based on this value of population density, determine whether each 
          virus particle should reproduce and add offspring virus particles to 
          the list of viruses in this patient.                    

        returns: The total virus population at the end of the update (an
        integer)
        """

        survivingViruses = [v  for v in self.viruses  if not v.doesClear()]
        self.viruses = survivingViruses

        popDensity = float(self.getTotalPop()) / self.maxPop
        
        newViruses = self.viruses[:]
        for v in self.viruses:
            try:                
                newVirus = v.reproduce(popDensity)
##                print newVirus.getMaxBirthProb()
##                print newVirus.getClearProb()
                newViruses.append(newVirus)
            except:
                pass
        self.viruses = newViruses

        return self.getTotalPop()
        


#
# PROBLEM 3
#
def simulationWithoutDrug(numViruses, maxPop, maxBirthProb, clearProb,
                          numTrials):
    """
    Run the simulation and plot the graph for problem 3 (no drugs are used,
    viruses do not have any drug resistance).    
    For each of numTrials trial, instantiates a patient, runs a simulation
    for 300 timesteps, and plots the average virus population size as a
    function of time.

    numViruses: number of SimpleVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: Maximum clearance probability (a float between 0-1)
    numTrials: number of simulation runs to execute (an integer)
    """
    timesteps = 300
    
    data = [0] * timesteps
    for i in range(numTrials):
        viruses = []
        for j in range(numViruses):
            virus = SimpleVirus(maxBirthProb, clearProb)            
            viruses.append(virus)
        p = Patient(viruses, maxPop)
        for k in range(timesteps):            
            data[k] += p.update()

    avgs = [float(x) / numTrials  for x in data]
    pylab.plot(avgs, label = str(numTrials) + ' Avg')
    pylab.title('Virus Population Simulation')
    pylab.xlabel('Time Steps')
    pylab.ylabel('Avg Virus Population Size')
    pylab.legend(loc='best')
    pylab.show()   

#
# PROBLEM 4
#
class ResistantVirus(SimpleVirus):
    """
    Representation of a virus which can have drug resistance.
    """   

    def __init__(self, maxBirthProb, clearProb, resistances, mutProb):
        """
        Initialize a ResistantVirus instance, saves all parameters as attributes
        of the instance.

        maxBirthProb: Maximum reproduction probability (a float between 0-1)       

        clearProb: Maximum clearance probability (a float between 0-1).

        resistances: A dictionary of drug names (strings) mapping to the state
        of this virus particle's resistance (either True or False) to each drug.
        e.g. {'guttagonol':False, 'srinol':False}, means that this virus
        particle is resistant to neither guttagonol nor srinol.

        mutProb: Mutation probability for this virus particle (a float). This is
        the probability of the offspring acquiring or losing resistance to a drug.
        """
        SimpleVirus.__init__(self, maxBirthProb, clearProb)
        self.maxBirthProb = maxBirthProb
        self.clearProb = clearProb
        self.resistances = resistances
        self.mutProb = mutProb

    def getResistances(self):
        """
        Returns the resistances for this virus.
        """
        return self.resistances

    def getMutProb(self):
        """
        Returns the mutation probability for this virus.
        """
        return self.mutProb

    def isResistantTo(self, drug):
        """
        Get the state of this virus particle's resistance to a drug. This method
        is called by getResistPop() in TreatedPatient to determine how many virus
        particles have resistance to a drug.       

        drug: The drug (a string)

        returns: True if this virus instance is resistant to the drug, False
        otherwise.
        """
        
        return self.resistances[drug]


    def reproduce(self, popDensity, activeDrugs):
        """
        Stochastically determines whether this virus particle reproduces at a
        time step. Called by the update() method in the TreatedPatient class.

        A virus particle will only reproduce if it is resistant to ALL the drugs
        in the activeDrugs list. For example, if there are 2 drugs in the
        activeDrugs list, and the virus particle is resistant to 1 or no drugs,
        then it will NOT reproduce.

        Hence, if the virus is resistant to all drugs
        in activeDrugs, then the virus reproduces with probability:      

        self.getMaxBirthProb * (1 - popDensity).                       

        If this virus particle reproduces, then reproduce() creates and returns
        the instance of the offspring ResistantVirus (which has the same
        maxBirthProb and clearProb values as its parent). The offspring virus
        will have the same maxBirthProb, clearProb, and mutProb as the parent.

        For each drug resistance trait of the virus (i.e. each key of
        self.resistances), the offspring has probability 1-mutProb of
        inheriting that resistance trait from the parent, and probability
        mutProb of switching that resistance trait in the offspring.       

        For example, if a virus particle is resistant to guttagonol but not
        srinol, and self.mutProb is 0.1, then there is a 10% chance that
        that the offspring will lose resistance to guttagonol and a 90%
        chance that the offspring will be resistant to guttagonol.
        There is also a 10% chance that the offspring will gain resistance to
        srinol and a 90% chance that the offspring will not be resistant to
        srinol.

        popDensity: the population density (a float), defined as the current
        virus population divided by the maximum population       

        activeDrugs: a list of the drug names acting on this virus particle
        (a list of strings).

        returns: a new instance of the ResistantVirus class representing the
        offspring of this virus particle. The child should have the same
        maxBirthProb and clearProb values as this virus. Raises a
        NoChildException if this virus particle does not reproduce.
        """
       
        if all(self.isResistantTo(drug)  for drug in activeDrugs):  #tests for resistances to ALL drugs       
            pReproduce = self.maxBirthProb * (1 - popDensity)
            if random.random() <= pReproduce: #tries to reproduce
                childResistances = {} #mutate newResistances
                for d in self.resistances:                    
                    if random.random() <= self.mutProb:
                        childResistances[d] = not self.resistances[d] #if mutation successful flip parent resistance value
                    else:
                        childResistances[d] = self.resistances[d]                        
                
                newVirus = ResistantVirus(self.maxBirthProb, self.clearProb,
                                       childResistances, self.mutProb)                
                return newVirus

        raise NoChildException(Exception)

class TreatedPatient(Patient):
    """
    Representation of a patient. The patient is able to take drugs and his/her
    virus population can acquire resistance to the drugs he/she takes.
    """

    def __init__(self, viruses, maxPop):
        """
        Initialization function, saves the viruses and maxPop parameters as
        attributes. Also initializes the list of drugs being administered
        (which should initially include no drugs).              

        viruses: The list representing the virus population (a list of
        virus instances)

        maxPop: The  maximum virus population for this patient (an integer)
        """

        Patient.__init__(self, viruses, maxPop)
        self.viruses = viruses
        self.maxPop = maxPop
        self.prescriptions = {}

    def addPrescription(self, newDrug):
        """
        Administer a drug to this patient. After a prescription is added, the
        drug acts on the virus population for all subsequent time steps. If the
        newDrug is already prescribed to this patient, the method has no effect.

        newDrug: The name of the drug to administer to the patient (a string).

        postcondition: The list of drugs being administered to a patient is updated
        """
        if newDrug not in self.prescriptions:
            self.prescriptions[newDrug] = False

    def getPrescriptions(self):
        """
        Returns the drugs that are being administered to this patient.

        returns: The list of drug names (strings) being administered to this
        patient.
        """

        return self.prescriptions.keys()


    def getResistPop(self, drugResist):
        """
        Get the population of virus particles resistant to the drugs listed in
        drugResist.       

        drugResist: Which drug resistances to include in the population (a list
        of strings - e.g. ['guttagonol'] or ['guttagonol', 'srinol'])

        returns: The population of viruses (an integer) with resistances to all
        drugs in the drugResist list.
        """

        resistantViruses = [virus  for virus in self.viruses
                            if all(virus.getResistances()[drug] == True  for drug in drugResist)]
        return len(resistantViruses)


    def update(self):
        """
        Update the state of the virus population in this patient for a single
        time step. update() should execute these actions in order:

        - Determine whether each virus particle survives and update the list of
          virus particles accordingly

        - The current population density is calculated. This population density
          value is used until the next call to update().

        - Based on this value of population density, determine whether each 
          virus particle should reproduce and add offspring virus particles to 
          the list of viruses in this patient.
          The list of drugs being administered should be accounted for in the
          determination of whether each virus particle reproduces.

        returns: The total virus population at the end of the update (an
        integer)
        """
        
        survivingViruses = [v  for v in self.viruses  if not v.doesClear()]
        self.viruses = survivingViruses

        popDensity = float(self.getTotalPop()) / self.maxPop
        
        newViruses = self.viruses[:]
        for v in self.viruses:
            try:                
                newVirus = v.reproduce(popDensity, self.getPrescriptions())
                newViruses.append(newVirus)
            except:
                pass
            self.viruses = newViruses

        return self.getTotalPop()
        
#
# PROBLEM 5
#
def simulationWithDrug(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials):
    """
    Runs simulations and plots graphs for problem 5.

    For each of numTrials trials, instantiates a patient, runs a simulation for
    150 timesteps, adds guttagonol, and runs the simulation for an additional
    150 timesteps.  At the end plots the average virus population size
    (for both the total virus population and the guttagonol-resistant virus
    population) as a function of time.

    numViruses: number of ResistantVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: maximum clearance probability (a float between 0-1)
    resistances: a dictionary of drugs that each ResistantVirus is resistant to
                 (e.g., {'guttagonol': False})
    mutProb: mutation probability for each ResistantVirus particle
             (a float between 0-1). 
    numTrials: number of simulation runs to execute (an integer)
    
    """          
    timesteps = 300
    
    totalPopData = [0] * timesteps
    drugResistPopData = [0] * timesteps                         
    
    for i in range(numTrials):
        viruses = [] # a list of 100 ResistantVirus instances
        for j in range(numViruses):
            v = ResistantVirus(maxBirthProb, clearProb, resistances, mutProb)
            viruses.append(v)
        
        p = TreatedPatient(viruses, maxPop)
        for m in range(2): #split the test in half once after adding the drug
            for k in range(timesteps/2):            
                totalPopData[k + (m * timesteps/2)] += p.update()
                drugResistPopData[k + (m * timesteps/2)] += p.getResistPop(['guttagonol'])
            p.addPrescription('guttagonol')                
            
    avg1 = [float(x) / numTrials  for x in totalPopData]
    avg2 = [float(x) / numTrials  for x in drugResistPopData]

    pylab.plot(avg1, label = 'totalPopData')
    pylab.plot(avg2, label = 'drugResistPopData')    
    pylab.xlabel('time step')
    pylab.ylabel('# viruses')
    pylab.title('ResistantVirus simulation')
    pylab.legend(loc = 'best')
    pylab.show()


# PS9
# PROBLEM 1
#
def simulationWithDrug_split(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials, timesteps):
    """
    runs n timesteps then an additional 150 steps

    For each of numTrials trials, instantiates a patient, runs a simulation for
    150 timesteps, adds guttagonol, and runs the simulation for an additional
    150 timesteps.  At the end plots the average virus population size
    (for both the total virus population and the guttagonol-resistant virus
    population) as a function of time.

    numViruses: number of ResistantVirus to create for patient (an integer)
    maxPop: maximum virus population for patient (an integer)
    maxBirthProb: Maximum reproduction probability (a float between 0-1)        
    clearProb: maximum clearance probability (a float between 0-1)
    resistances: a dictionary of drugs that each ResistantVirus is resistant to
                 (e.g., {'guttagonol': False})
    mutProb: mutation probability for each ResistantVirus particle
             (a float between 0-1). 
    numTrials: number of simulation runs to execute (an integer)
    
    """              
    timestepParams = [timesteps, 150]
    totalPopData = [0] * sum(timestepParams)
    results = []
    
    for i in range(numTrials):
        viruses = [] # a list of 100 ResistantVirus instances
        for j in range(numViruses):
            v = ResistantVirus(maxBirthProb, clearProb, resistances, mutProb)
            viruses.append(v)
        
        p = TreatedPatient(viruses, maxPop)
        for m in range(2): #split the test in half once after adding the drug
            for k in range(timestepParams[m]):            
                totalPopData[k + (m * timesteps/2)] += p.update()
                
            p.addPrescription('guttagonol')
        results.append(totalPopData[-1])
            
    return results
    
    
def test():
    virus = SimpleVirus(0.2, 0.5)
    viruses = []
    viruses.append(virus)
    
    p = Patient(viruses, 10)
    print p.getMaxPop()
    print p.getTotalPop()
    
    print p.update()
    

def test2():
    numViruses = 100
    maxPop = 1000
    maxBirthProb = 0.1
    clearProb = 0.05
    numTrials = 1
    simulationWithoutDrug(numViruses, maxPop, maxBirthProb, clearProb, numTrials)

def test3():
    maxBirthProb = 0.2
    clearProb = 0.5
    resistances = {'guttagonol':False, 'srinol':False}
    mutProb = 0.1
    virus = ResistantVirus(maxBirthProb, clearProb, resistances, mutProb)
    print virus.getMutProb()
    print virus.isResistantTo('srinol')

def test4():
    virus = ResistantVirus(1.0, 0.0, {}, 0.0)
    patient = TreatedPatient([virus], 100)
    for i in range(100): #    Updating patient 5 times
        patient.update()
    print patient.getTotalPop()

def test5():
    virus1 = ResistantVirus(1.0, 0.0, {"drug1": True}, 0.0)
    virus2 = ResistantVirus(1.0, 0.0, {"drug1": False}, 0.0)
    patient = TreatedPatient([virus1, virus2], 1000000)
    patient.addPrescription("drug1")
    for i in range(5): #    Updating patient 5 times
        patient.update()
    print patient.getTotalPop()

def test6():
    #Each ResistantVirus instance in the viruses list should be initialized with the following parameters:
    numViruses = 100
    maxPop = 1000
    maxBirthProb = 0.1
    clearProb = 0.05
    resistances = {'guttagonol': False}
    mutProb = 0.005    
    numTrials = 1
    
    simulationWithDrug(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials)

def test7():
    #Each ResistantVirus instance in the viruses list should be initialized with the following parameters:
    numViruses = 100
    maxPop = 1000
    maxBirthProb = 0.1
    clearProb = 0.05
    resistances = {'guttagonol': False}
    mutProb = 0.005    
    numTrials = 10
    timesteps = 0
    
    trial = simulationWithDrug_split(numViruses, maxPop, maxBirthProb, clearProb, resistances,
                       mutProb, numTrials, timesteps)

    pylab.hist(trial)
    pylab.show()
    
test7()
