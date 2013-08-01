# implementation of card game - Memory

import simplegui
import random

WIDTH = 800
HEIGHT = 100
CARD_WIDTH = WIDTH / 16
CARD_COLORS = ["Black", "Yellow", "Grey"]
moves = 0

# helper function to initialize globals
def take_card(cardChoices):
    index = random.randrange(len(cardChoices))
    result = cardChoices[index]
    cardChoices.pop(index)       
    return result
    
def init_exposed():
    global exposed, state, previous, moves
    previous = [None, None]
    state, moves = 0, 0
    exposed = [0  for i in range(16)] #contains three possible states (0,1,2). used to index number color

def queue_previous(index):
    global previous
    previous.pop()
    previous.insert(0, index)
    
def init():
    global deck
    cardChoices = [i  for j in range(2)  for i in range(8)]
    init_exposed()
    deck = [take_card(cardChoices) for i in range(16)]
    
# define event handlers
def set_exposed(after=False):
    global state, previous    
    if state == 2:            
        if after:
            if deck[previous[0]] == deck[previous[1]]:
                exposed[previous[0]] = 2
                exposed[previous[1]] = 2                              
        else:
            if deck[previous[0]] != deck[previous[1]]:
                exposed[previous[0]] = 0
                exposed[previous[1]] = 0    
            previous = [None, None]
            state = 0   
            
def mouseclick(pos):
    global state, moves    
    cardIndex = pos[0] // CARD_WIDTH
    if exposed[cardIndex] == 0:           
        set_exposed()
        exposed[cardIndex] = 1
        queue_previous(cardIndex)
        state +=1            
        moves +=1        
        set_exposed(True)      
                        
# cards are logically 50x100 pixels in size    
def draw(canvas):
    l.set_text("Moves = " + str(moves // 2)) 
    letterAdj = CARD_WIDTH * .85    
    xPos = 0
    
    for i in range(len(deck)):
        colorIndex = exposed[i]
        xPos += CARD_WIDTH            
        canvas.draw_line((xPos + 1, 0), (xPos, HEIGHT), 1, "White")        
        canvas.draw_text(str(deck[i]), (xPos - letterAdj, 70), CARD_WIDTH, CARD_COLORS[colorIndex])      

# create frame and add a button and labels
frame = simplegui.create_frame("Memory", WIDTH, HEIGHT)
frame.add_button("Restart", init)
l=frame.add_label("Moves = 0")

# initialize global variables
init()

# register event handlers
frame.set_mouseclick_handler(mouseclick)
frame.set_draw_handler(draw)

# get things rolling
frame.start()


# Always remember to review the grading rubric
