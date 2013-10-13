import random

# constants
FLIPS_PER_COIN = 10
NUMBER_OF_COINS = 1000

""" main simulation of n trials
    takes an integer and returns the average values for v1, vRand, vMin 
"""
def simulate(n):

    # results collectors
    results = [0, 0, 0]

    #append results in the order of the output tuple    
    for i in range(n):
        trialResult = run_trial()
        for j in range(len(trialResult)):
            results[j] += trialResult[j]

    for result in results:
        print(result / n)

# a single trial
def run_trial():
    coins = [0]*NUMBER_OF_COINS
    
    #flip 1000 coins
    for i in range(NUMBER_OF_COINS):

        # flip each coin independently 10 times. heads is integer 0. count heads.
        for j in range(FLIPS_PER_COIN):
            if (random.randrange(2) == 0):
                coins[i] +=1

    # calculate results
    denominator = float(FLIPS_PER_COIN)

    result1 = coins[0] / denominator

    cRand = random.choice(coins)
    resultRand = cRand / denominator

    resultMin = min(coins) / denominator 
    
    return result1, resultRand, resultMin

    
simulate(100000)
