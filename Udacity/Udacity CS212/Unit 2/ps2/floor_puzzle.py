#------------------
# User Instructions
#
# Hopper, Kay, Liskov, Perlis, and Ritchie live on 
# different floors of a five-floor apartment building. 
#
# Hopper does not live on the top floor. 
# Kay does not live on the bottom floor. 
# Liskov does not live on either the top or the bottom floor. 
# Perlis lives on a higher floor than does Kay. 
# Ritchie does not live on a floor adjacent to Liskov's. 
# Liskov does not live on a floor adjacent to Kay's. 
# 
# Where does everyone live?  
# 
# Write a function floor_puzzle() that returns a list of
# five floor numbers denoting the floor of Hopper, Kay, 
# Liskov, Perlis, and Ritchie.

import itertools

def nextto(x, y):
    return abs(x-y) == 1

def floor_puzzle():
    """
    names = list
    permutations = numbers
    """
    people = ('Hopper', 'Kay', 'Liskov', 'Perlis', 'Ritchie')
    floors = bottom, _, _, _, top = list(range(1, len(people)+1))
    
    orderings = list(itertools.permutations(floors))
    return next([Hopper, Kay, Liskov, Perlis, Ritchie]
                for (Hopper, Kay, Liskov, Perlis, Ritchie) in orderings
                if not Hopper is len(people) #Hopper not on the top floor
                if not Kay is bottom
                if not Liskov is len(people)
                if not Liskov is bottom
                if not Kay is bottom
                if Perlis >= Kay
                if not nextto(Ritchie, Liskov)
                if not nextto(Kay, Liskov) 
                )      
    

print floor_puzzle()
