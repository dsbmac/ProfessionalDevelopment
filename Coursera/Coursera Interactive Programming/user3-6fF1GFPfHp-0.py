# template for "Guess the number" mini-project
# input will come from buttons and an input field
# all output for the game will be printed in the console

import random
import simplegui

# initialize global variables used in your code
low = 0 #low limit
high = 100
answer = random.randrange(low, high) #the number answer
guess = low - 1 #user's guess
guessesAllowed = 0
guessCount = 0

def setParams(): #sets game's parameters
    global guessCount, guessesAllowed, answer
    answer = random.randrange(low, high)    
    guessesAllowed = guesses_allowed(float(high))
    guessCount = 0
def guesses_allowed(high): #recursively sets guess limit (ooh fancy)
    if round(high) == 1:
        return 0
    else:
        return 1 + guesses_allowed(high / 2)
def reply(guess): #response for every guess
    global guessCount
    num = int(guess)    
    print "You guessed, " + guess
    if num == answer:
        print "That's it! You guessed my number! It was " + str(answer) + "."
        guessCount = 0
        get_input()
    else:
        if num < answer:
            print 'Higher...'
        elif num > answer:
            print 'Lower...'
        guessCount += 1
        print "You have " + str(guessesAllowed - guessCount) + " remaining."
        if guessCount == guessesAllowed:
            get_input()            
        
# define event handlers for control panel
def input_guess(guess): #main input handler
    global inp
    if guess.isdigit():        
        reply(guess)
        inp.set_text("New label")
    else:
        print '"' + guess + '"' + " isn't a valid number."
def range100():
    # button that changes range to range [0,100) and restarts
    global high
    high = 100
    get_input()
def range1000():
    # button that changes range to range [0,1000) and restarts
    global high
    high = 1000
    get_input()
def get_input():
    # main game logic goes here 
    setParams()
    print
    print "Try and guess my number from " + str(low) + " to " + str(high-1) + '.'    
    print "You have " + str(guessesAllowed - guessCount) + " guesses remaining."
# create frame
frame = simplegui.create_frame("Main", 100, 200)
frame.set_canvas_background("White")

# register event handlers for control elements
button100 = frame.add_button("Range [0-100)", range100, 100)
button1000 = frame.add_button("Range [0-1000)", range1000, 100)
inp = frame.add_input("Your Guess", input_guess, 50)
# start frame
frame.start()
get_input()

# always remember to check your completed program against the grading rubric

