# -------------
# User Instructions
#
# Write a function, solve(formula) that solves cryptarithmetic puzzles.
# The input should be a formula like 'ODD + ODD == EVEN', and the 
# output should be a string with the digits filled in, or None if the
# problem is not solvable.
#
# Note that you will not be able to run your code yet since the 
# program is incomplete. Please SUBMIT to see if you are correct.

import string, re, itertools
from string import maketrans

# assume: def fill_in(formula):
#        "Generate all possible fillings-in of letters in formula with digits."
    
def valid(f):
    """Formula f is valid if and only if it has no 
    numbers with leading zero, and evals true."""
    try: 
        return not re.search(r'\b0[0-9]', f) and eval(f) is True
    except ArithmeticError:
        return False

def getIntab(words, firstLtrs):
    intab= ''
    letters = ''.join(words)    
    for char in letters:
        if char not in intab:
            intab +=char

    #first letter indexes
    indexes = [] 
    for i in firstLtrs:
        indexes.append(intab.index(i))
        
    return intab, sorted(indexes)
    
    
def boolFirstLtr(perm, firstLtrsIndex):
    for i in firstLtrsIndex:        
        if perm[i] == '0':
            return False
    return True
            
def genOuttab(intab, firstLtrs):
    itr = (''.join(list(i))  for i in itertools.permutations(string.digits, len(intab))
           if boolFirstLtr(i, firstLtrs))
    return itr   

def getGenArgs(formula):
    pat = re.compile(r"\b([^\W\d]+)")
    words = pat.findall(formula)
    pat = re.compile(r"\b([^\W\d])")
    firstLtrs = set(pat.findall(formula))    
   
    return getIntab(words, firstLtrs)

def solve(formula):
    """Given a formula like 'ODD + ODD == EVEN', fill in digits to solve it.
    Input formula is a string; output is a digit-filled-in string or None."""

    intab, firstLtrsIndex = getGenArgs(formula)
    
    itr = genOuttab(intab, firstLtrsIndex)    
    for outtab in itr:
        trantab = maketrans(intab, outtab)
        attempt = formula.translate(trantab)        
        if valid(attempt):
            return attempt
        
    return None

def test():
    #s = 'ODD + ODD == EVEN'
    s = 'A2 + BE2 == BY**2'
    print solve(s)  
test()    
