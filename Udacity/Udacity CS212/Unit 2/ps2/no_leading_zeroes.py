# --------------
# User Instructions
# 
# Modify the function compile_formula so that the function 
# it returns, f, does not allow numbers where the first digit
# is zero. So if the formula contained YOU, f would return 
# False anytime that Y was 0 

import re
import itertools
import string
import inspect

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
    return eval(f), f, letters

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

def no_leading_zeroes(fString, letters, digits):
    #print 'fString:', fString
    pat = re.compile(r"10+\*([A-Z])\)")
    leadingLtrs = set(pat.findall(fString))
    #print 'leadingLtrs:', leadingLtrs
    for c in leadingLtrs:
        if digits[letters.index(c)] == 0: return False
    return True
    
    
def faster_solve(formula):
    """Given a formula like 'ODD + ODD == EVEN', fill in digits to solve it.
    Input formula is a string; output is a digit-filled-in string or None.
    This version precompiles the formula; only one eval per formula."""
    #print formula
    f, fString, letters = compile_formula(formula)
    for digits in itertools.permutations((1,2,3,4,5,6,7,8,9,0), len(letters)):
        try:                       
            if no_leading_zeroes(fString, letters, digits) and f(*digits) is True : 
                table = string.maketrans(letters, ''.join(map(str, digits)))
                return formula.translate(table)
              
        except ArithmeticError:
            pass
    return None


def test():
    print '1'
    assert faster_solve('A + B == BA') == None # should NOT return '1 + 0 == 01'
    print '2'
    assert faster_solve('YOU == ME**2') == ('289 == 17**2' or '576 == 24**2' or '841 == 29**2')
    print '3'
    assert faster_solve('X / X == X') == '1 / 1 == 1'
    return 'tests pass'

#print faster_solve('X / Y == X')
#print faster_solve('A + B == BA')
#print faster_solve('YOU == ME**2')
test()
