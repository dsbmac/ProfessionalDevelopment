import string
import fileinput

GAMELIST_FILENAME = "noise.txt"
#GAMELIST_FILENAME = "test.txt"

##def is_start(str):
##    print str
##    return str[0].islower() and str[1].isupper()
##
##def the_rest(str):
##    return str[].islower() and str[1].isupper()

#print is_start('bBaaB')

def equality():
    cnt = 1
    answer = ''
    
    for line in fileinput.input([GAMELIST_FILENAME]):
        #print line 
        for i in range(0,len(line)-8):         
            if line[i].islower():
                if line[i+1:i+4].isupper():
                    #print True, line[i+1:i+4]
                    if line[i+4].islower():  
                        if line[i+5:i+8].isupper():
                            if line[i+8].islower():
                                answer += line[i+4]
##                                print line
##                                return "is_start, ind: ", line[i+1:i+8], cnt, i
        cnt +=1
    print answer
print equality()
