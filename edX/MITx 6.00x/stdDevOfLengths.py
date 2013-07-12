def stdDevOfLengths(L):
    """
    L: a list of strings

    returns: float, the standard deviation of the lengths of the strings,
      or NaN if L is empty.
    """
    if L:
        N = float(len(L)
        mean = sum(len(t)  for t in L) / N)
        result = (sum((len(t)-mean)**2  for t in L) / N)**0.5
        return result
    else:
        return float('NaN')
    
def test():
    assert(    stdDevOfLengths(['a', 'z', 'p']) == 0)
    assert(    stdDevOfLengths(['apples', 'oranges', 'kiwis', 'pineapples']) == 1.8708)
    print 'all tests passed'

test()
