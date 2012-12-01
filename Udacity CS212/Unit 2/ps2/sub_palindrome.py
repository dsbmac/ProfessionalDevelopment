# --------------
# User Instructions
#
# Write a function, longest_subpalindrome_slice(text) that takes 
# a string as input and returns the i and j indices that 
# correspond to the beginning and end indices of the longest 
# palindrome in the string. 
#
# Grading Notes:
# 
# You will only be marked correct if your function runs 
# efficiently enough. We will be measuring efficency by counting
# the number of times you access each string. That count must be
# below a certain threshold to be marked correct.
#
# Please do not use regular expressions to solve this quiz!

import cProfile

def rec_palin(text):    
    if len(text) <= 1: return True
    return text[0] == text[-1] and rec_palin(text[1:-1])
def get_max_palin(text, beg, end): #beg and end are slice indices
##    print beg, end
    if (beg < 0 or end > len(text)) or text[beg] != text[end-1]:
        return (beg+1, end-1) 
    return get_max_palin(text, beg-1, end+1)
    
##def longest_subpalindrome_slice(text):
##    "Return (i, j) such that text[i:j] is the longest palindrome in text."
##    text = text.lower()
##    result = (,)
####    print
####    print 'string:', text, len(text)
##    if text == '': return (0, 0)
##    for i in range(len(text)):
####        print 'i:', i
##        for j in range(len(text), i+1, -1):
##            t = text[i:j]
####            print 'count:', t.count(t[0])
##            if t.count(t[0])> 1:
##                print "recurse..."
##                print ' '* i, j, t
##                result = rec_palin(t)
##                if result:
##    ##                print result
##                    return i, j
            
def longest_subpalindrome_slice(text):
    "Return (i, j) such that text[i:j] is the longest palindrome in text."
    text = text.lower()
    result = []
    maxLength = 0
##    print
##    print 'string:', text, len(text)
    if text == '': return (0, 0)
    for i in range(2, 4): #size length
##        print 'i:', i
        for j in range(0, len(text) - i + 1):
            t = text[j:j+i]
##            print ' '* j, j, t, rec_palin(t)
##            print t, rec_palin(t)
            if rec_palin(t):
                if result == []:
                    result = (j, j+i)
                    maxLength = i
                tpl = get_max_palin(text, j, j+i)
                length = tpl[1] - tpl[0]
##                print 'length', length, tpl
                if length > maxLength:
                    result = tpl
    print result
    return result
         
##    print palins
##    print 'next phase'
##    while len(palins) > 0:
##        pal = palins.pop()
##        #t = text[pal[0]-1] + text[pal[1]]
##        a,b = pal
##        t = text[a] + text[b]
##        if rec_palin(t):
##            print 'another palin'
        
##            print 'count:', t.count(t[0])
            
##            if t.count(t[0])> 1:
##                print "recurse..."

##                result = rec_palin(t)
##                if result:
##    ##                print result
##                    return i, j

L = longest_subpalindrome_slice    
def test():
    assert L('racecar') == (0, 7)
    assert L('Racecar') == (0, 7)
    assert L('RacecarX') == (0, 7)
    assert L('Race carr') == (7, 9)
    assert L('') == (0, 0)
    assert L('something rac e car going') == (8,21)
    assert L('xxxxx') == (0, 5)
    assert L('Mad am I ma dam.') == (0, 15)
    print 'tests pass'
#print L('something rac e car going')
#print L('Race carr')
cProfile.run('test()')
