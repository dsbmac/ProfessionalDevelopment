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
import cProfile
import pstats
from string import maketrans

# --------------
# User Instructions
#
# Write a function, compile_word(word), that compiles a word
# of UPPERCASE letters as numeric digits. For example:
# compile_word('YOU') => '(1*U + 10*O +100*Y)' 
# Non-uppercase words should remain unchaged.

##def compile_word(word):
##    """Compile a word of uppercase letters as numeric digits.
##    E.g., compile_word('YOU') => '(1*U+10*O+100*Y)'
##    Non-uppercase words unchanged: compile_word('+') => '+'"""
##    ltrs = re.findall(r"[A-Z]", word)[::-1]
##    place = 1
##    result = ''
##    for i in ltrs:
##        
##    print '(1*{0}+10*{1}+100*{2})'.format(*ltrs)
##    
##s = 'YOUa'
##compile_word(s)
    
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

def compile_formula(formula, verbose=False):
    """Compile formula into a function. Also return letters found, as a str,
    in same order as parms of function. The first digit of a multi-digit 
    number can't be 0. So if YOU is a word in the formula, and the function
    is called with Y eqal to 0, the function should return False."""
    
    # modify the code in this function.
    
    letters = ''.join(set(re.findall('[A-Z]', formula)))
    parms = ', '.join(letters)
    tokens = map(compile_word, re.split('([A-Z]+)', formula))
    body = ''.join(tokens)
    f = 'lambda %s: %s' % (parms, body)
    if verbose: print f
    return eval(f), letters

def compile_word(word):
    """Compile a word of uppercase letters as numeric digits.
    E.g., compile_word('YOU') => '(1*U+10*O+100*Y)'
    Non-uppercase words uncahanged: compile_word('+') => '+'"""
    if word.isupper():
        terms = [('%s*%s' % (10**i, d)) 
                 for (i, d) in enumerate(word[::-1])]
        return '(' + '+'.join(terms) + ')'
    else:
        return word
    
def faster_solve(formula):
    """Given a formula like 'ODD + ODD == EVEN', fill in digits to solve it.
    Input formula is a string; output is a digit-filled-in string or None.
    This version precompiles the formula; only one eval per formula."""
    f, letters = compile_formula(formula)
    for digits in itertools.permutations((1,2,3,4,5,6,7,8,9,0), len(letters)):
        try:
            if f(*digits) is True:
                table = string.maketrans(letters, ''.join(map(str, digits)))
                return formula.translate(table)
        except ArithmeticError:
            pass
        
def test():
    strings  = ['ODD + ODD == EVEN', 
                'TWO + TWO == FOUR']

#'ATOM**0.5 == A + T + O + M'] 'A2 + BE2 == BY**2',
    for s in strings:
        #print solve(s)
        print faster_solve(s)
#cProfile.run('test()')
cProfile.run('test()')



   
