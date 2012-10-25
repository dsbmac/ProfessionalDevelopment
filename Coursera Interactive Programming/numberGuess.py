# template for "Guess the number" mini-project
# input will come from buttons and an input field
# all output for the game will be printed in the console

import random
import simplegui

# initialize global variables used in your code
low = 0
high = 3
answer = random.randrange(low, high)
guess = low - 1

def reply(num):
    if num < answer:
        return 'Higher'
    elif num > answer:
        return 'Lower'
    return "That's it! You guessed my number (" + answer + ")!"
def draw():
    canvas.draw_text("Sample text", (50,50), 12, "Red")
    
# define event handlers for control panel
def input_guess(guess):
    num = int(guess)    
    print reply(num), answer
def range100():
    # button that changes range to range [0,100) and restarts
    global high
    high = 100
def range1000():
    # button that changes range to range [0,1000) and restarts
    global high
    high = 1000
def get_input(guess):
    # main game logic goes here	
    return
    
# create frame
frame = simplegui.create_frame("Main", 200, 100, 200)
inp = frame.add_input("Guess", input_guess, 40)
button100 = frame.add_button("100", range100, 50)
button1000 = frame.add_button("1000", range1000, 50)
# register event handlers for control elements
frame.set_draw_handler(draw)

# start frame


# always remember to check your completed program against the grading rubric

