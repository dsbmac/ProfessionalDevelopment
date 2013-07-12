import hashlib
import random
import string


def hash_str(s):
    return hashlib.md5(s).hexdigest()

def make_secure_val(s):
    return "%s,%s" % (s, hash_str(s))

# -----------------
# User Instructions
# 
# Implement the function check_secure_val, which takes a string of the format 
# s,HASH
# and returns s if hash_str(s) == HASH, otherwise None 

def check_secure_val(h):
    lst = h.split(',')
    if hash_str(lst[0]) == lst[1]: return lst[0]
    else: return None

# implement the function make_salt() that returns a string of 5 random
# letters use python's random module.
# Note: The string package might be useful here.

def make_salt():    
    salt = ''.join(random.choice(string.letters) for i in xrange(5))
    return salt

def make_pw_hash(name, pw):
    return

#print check_secure_val('1,c4ca4238a0b923820dcc509a6f75849b')
make_salt()
