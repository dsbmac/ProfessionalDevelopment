import random
# Rock-paper-scissors-lizard-Spock template


# The key idea of this program is to equate the strings
# "rock", "paper", "scissors", "lizard", "Spock" to numbers
# as follows:
#
# 0 - rock
# 1 - Spock
# 2 - paper
# 3 - lizard
# 4 - scissors

# helper functions
reference = ['rock','Spock','paper','lizard', 'scissors']
def number_to_name(number):
    # fill in your code below
    
    # convert number to a name using if/elif/else
    # don't forget to return the result!
    return reference[number]
    
def name_to_number(name):
    # fill in your code below
    
    # convert name to number using if/elif/else
    # don't forget to return the result!
    return reference.index(name)

def rpsls(name): 
    # fill in your code below

    # convert name to player_number using name_to_number
    player_number = name_to_number(name)
    
    # compute random guess for comp_number using random.randrange()
    comp_number = random.randrange(0,5)

    # compute difference of player_number and comp_number modulo five
    score = ( comp_number - player_number) % len(reference)

    # use if/elif/else to determine winner
    if 1 <= score <= 2:
        winner = 'Computer'
    elif 3 <= score <= 4:
        winner = 'Player'
    else:
        winner = 'Nobody'

    # convert comp_number to name using number_to_name
    comp_number = number_to_name(comp_number)
    
    # print results
    print 'Player chooses ' + name
    print 'Computer chooses ' + comp_number
    print winner + ' wins!'
    print
    
# test your code

rpsls("rock")
rpsls("Spock")
rpsls("paper")
rpsls("lizard")
rpsls("scissors")

# always remember to check your completed program against the grading rubric


