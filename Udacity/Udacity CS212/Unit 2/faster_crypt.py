'''
if adding then the longer digit must be a one
if adding then the first number must be even
'''

# --------------
# User Instructions
#
# Write a function, compile_word(word), that compiles a word
# of UPPERCASE letters as numeric digits. For example:
# compile_word('YOU') => '(1*U + 10*O +100*Y)' 
# Non-uppercase words should remain unchaged.

import re
import itertools
import string
import cProfile

def compile_word(word):
    if word.isupper():
        terms = ['{0}*{1}'.format(10**i, ltr)
                 for i, ltr in enumerate(word[::-1])]
        return '(' + '+'.join(terms) + ')'
    else:
        return word
    
def compile_word_norvig(word):
    if word.isupper():
        terms = [('%s*%s' % (10**i, d))
                 for (i, d) in enumerate(word[::-1])]
        return '(' + '+'.join(terms) + ')'
    else:
        return word
    
def compile_formula(formula):
    letters = set(re.findall(r'[A-Z]', formula))
    firstLtrs = set(re.findall(r'\b[A-Z]', formula))
    words = re.split(r'\s', formula)
    xx = ''.join(map(compile_word, words))
    f = 'lambda {0}: {1}'.format(','.join(letters), xx)

    return eval(f), ''.join(letters), firstLtrs

def solve(formula):
    f, letters, firstLtrs = compile_formula(formula)
    for digits in itertools.permutations((0,1,2,3,4,5,6,7,8,9), len(letters)):
        try:
            if f(*digits) is True:
                table = string.maketrans(letters, ''.join(map(str,digits)))
                return formula.translate(table)
        except ArithmeticError:
            pass
        
def apply_logic(letters, firstLtrs):
    choices = [[0,1,2,3,4,5,6,7,8,9]  for ltr in letters]
    for ltr in firstLtrs:
        lst = choices[letters.index(ltr)]
        lst.pop(lst.index(0))
    
    return choices    

##def genPerm(choices):
##    for i in choices:
        
def solve_dsb(formula):
    f, letters, firstLtrs = compile_formula(formula)
    choices = apply_logic(letters, firstLtrs)
    l = len(letters)
    for digits in itertools.product(*choices):
        if len(set(digits)) == l:
            try:
                if f(*digits) is True:
                    d = ''.join(map(str, digits))
                    table = string.maketrans(letters, d)
                    return formula.translate(table)
            except ArithmeticError:
                pass
    
formulas  = ['ODD + ODD == EVEN', 
            'TWO + TWO == FOUR']
#'NUMBER + NUMBER == PUZZLE'             ]

##print compile_word('YOU')
##print compile_word('H3H')
#print solve_dsb(formulas[2])
#print solve(formulas[2])
##print compile_word_norvig('EVEN')
#print solve(formulas[0])
def test():
    for formula in formulas:
        print solve(formula)
        
cProfile.run('test()', sort=2)
