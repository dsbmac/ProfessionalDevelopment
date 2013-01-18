#import string
import fileinput

GAMELIST_FILENAME = "noise.txt"
#GAMELIST_FILENAME = "test.txt"


#takes a readline from the poker.txt file and splits into player1 and 2 hands. returns both hands
def make_player_hands(line):

    rawHands = line.replace(' ', ',').split(',')
    hand1 = rawHands[:5]
    hand2 = rawHands[5:]

    return hand1, hand2

def seperate_properties(hand):
    rank =[]
    suit = []

    #seperate rank and suit
    for i in range(0,len(hand)):
        rank.append(hand[i][0])
        suit.append(hand[i][1])
    
    for i, val in enumerate(rank):
        rank[i] = convert_rank(val)
    rank = sorted(rank)
    rank.reverse()

    return rank, suit


#input array of 5 ints, output true or false if it is a straight.
#the plus refers to the added functionality of switching the 14 ace value in the case of a wheel
def is_straight_plus(hand):
    h = hand
    h.sort()
    h.reverse()
    for i in range(len(h)-2,0,-1 ):
        #print 'i:', i
        if h[i] - 1 != h[i+1]:
            return False, h
    #print "i", i 
    if h[i-1] - 1 == h[i] :
        return True, h
    elif min(h) == 2 and h.count(14) == 1:
        h.remove(14)
        h.append(1)
        return True, h 
    else:
        return False, h

#print is_straight_plus([14,5,2,4,3])

def is_flush(suits):
    for i in range(0, len(suits)-1):
        if suits[i] != suits[i+1]:
            return False
    return True

#input list of rank int and outpus zeroes added string
def add_zeroes(rank):
    score = ''

    #adds a zero to single digits
    for num in rank:
        if len(str(num)) == 1:
            score += "0" + str(num)
        else:
            score += str(num)

    return score

#this takes a rank list and a repetition count list and outputs a sorted order by poker ranking
def rank_resort(rank, countList):
    s = []
    result = []
    
    for i in range(4,0,-1):
        s = []
        for j, val in enumerate(countList):
            if i == val:
                s.append(rank[j])
        if s != []:
            s.sort()
            s.reverse()
            result.append(s)
    result = [item for sublist in result  for item in sublist]
    return result


def hand_score(rank, suit):    
    r = []
    #counts how many repetitions of each rank
    for c in rank:
        r.append(rank.count(c))

    rank = rank_resort(rank,r)
    score = add_zeroes(rank)
    handRank = max(r)-1

    if handRank == 0:
        #this if for the special case of resorting the wheel and swithcing the 14 to 1
        s = is_straight_plus(rank)
        isStraight = s[0]
        straightRank = s[1]        
        if is_flush(suit) and isStraight:
            return '8' + add_zeroes(straightRank)
        elif isStraight:
                return '4' + add_zeroes(straightRank)
        elif is_flush(suit):
            return '5' + score
        else:
            return '0' + score
    #1 pair
    elif handRank == 1:
        if r.count(2) == 4:
            return '2' + score
        else:
            return '1' + score

    #2 pair
    elif handRank == 2:
        if r.count(2) > 0:
            return '6' + score
        else:
            return '3' + score
    elif handRank == 3:
        return '7' + score
    else:
        return -666

#print hand_score([5,4,5,2,13],['S','C','D','H','H'])


    
def p54():
    results = []
    
    for line in fileinput.input([GAMELIST_FILENAME]):
#        print line
        win = winner(line)
#        print "Player", win, "wins"
        results.append(win)
#    print results
    return results.count(1)
    
print p54()
