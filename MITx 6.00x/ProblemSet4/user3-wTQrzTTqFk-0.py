# template for "Guess the number" mini-project
# input will come from buttons and an input field
# all output for the game will be printed in the console

import random
import simplegui

LOW = 0
HIGH = 3
# initialize global variables used in your code
answer = random.randrange(LOW, HIGH)
guess = LOW - 1

def reply(num):
    if num < answer:
        return 'Higher'
    elif num > answer:
        return 'Lower'
    return "That's it! You guessed my number (" + answer + ")!"
# define event handlers for control panel
def input_guess(guess):
    num = int(guess)    
    print reply(num), answer
def range100():
    # button that changes range to range [0,100) and restarts
    return 
def range1000():
    # button that changes range to range [0,1000) and restarts
    return
def get_input(guess):
    # main game logic goes here	
    return
    
# create frame
frame = simplegui.create_frame("Main", 100, 100)
inp = frame.add_input("Guess", input_guess, 40)

# register event handlers for control elements


# start frame


# always remember to check your completed program against the grading rubric

