from numpy import *

a = array([2,3,4])

lst = [1,2,3]

def test(lst):
    arr = array(lst)
    mean = arr.mean()
    sd = arr.std()
    
    print mean, sd


test(lst)

