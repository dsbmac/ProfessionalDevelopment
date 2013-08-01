# CodeSkulptor runs Python programs in your browser.
# Click the upper left button to run this simple demo.

# CodeSkulptor runs in Chrome 18+, Firefox 11+, and Safari 6+.
# Some features may work in other browsers, but do not expect
# full functionality.  It does NOT run in Internet Explorer.

import simplegui
import math

#Global state
width =300
height = 200
clockCtr = [width/2, height/2 - 15]
clockRadius = 40
splitRadius = clockRadius * 1
splitPosition = [clockCtr[0], clockCtr[1] - clockRadius]
score = 0
attempts = 0
scoreboard = "Welcome!" #shows scores/attempts
message = 'start'
interval = 100 #timer interval
clock = '' #clock string
time = 0 #stores the time elapsed in millisecs
prevTime = -1;
points = 10 #theta angle points

#converts aggregate time into units of time
def convertToSplit():
    return str(time % 10)    
def convertToSeconds():
    seconds = int(time / 10) % 60
    secondsDisplay = str (seconds)
    if seconds < 10:
        secondsDisplay = '0' + secondsDisplay
    return secondsDisplay
def convertToMinutes():
    minutes = int((time / 10)/ 60)
    return str(minutes)
#scoreboard stuff
def calculateScore():
    global score, attempts, prevTime
    split = int(convertToSplit())
    if not prevTime == time:
        if split == 0:     
            score += 1
        attempts += 1        
        prevTime = time;
        updateScoreboard()
def updateScoreboard():
    global scoreboard
    percentage = 0
    if not attempts == 0:
        percentage = int(score / attempts * 100)
    scoreboard = str(score) + '/' + str(attempts) + ": " + str(percentage) + '%'
def moveSplitHand():
    slice = 2 * math.pi / points;
    theta = slice * ((time % points) - (points / 4));
    splitPosition[0] = clockCtr[0] + splitRadius * math.cos(theta)
    splitPosition[1] = clockCtr[1] + splitRadius * math.sin(theta)    

# Event Handlers
# Handler for tick
def tick():
    global time, clock
    minutes, seconds, splitSeconds = 0,0,0
    time += 1 #increments the time value
    split = convertToSplit()
    seconds = convertToSeconds()    
    minutes = convertToMinutes()
    moveSplitHand()
    
    clock = minutes + ':' + seconds + '.' + split    
# Handler for start
def start():
    timer.start()
# Handler for stop
def stop():
    global scoreboard
    timer.stop()
    calculateScore()
# Handler for reset
def reset():
    global score, attempts, time
    score = 0
    attempts = 0
    time = 0
    updateScoreboard()

# Handler to draw on canvas
def draw(canvas):
    canvas.draw_line(clockCtr, (clockCtr[0], clockCtr[1] - clockRadius), 6, "Red") #mark
    canvas.draw_line(clockCtr, splitPosition, 2, "Yellow") #split hand
    canvas.draw_text(clock, [width/4+15,height-20], 36, "Yellow")
    canvas.draw_text(scoreboard, [5,25], 20, "Red")
    canvas.draw_circle(clockCtr, clockRadius, 5, "Yellow")
        
# Create a frame and assign callbacks to event handlers
frame = simplegui.create_frame("Home", width, height)

timer = simplegui.create_timer(interval, tick)
frame.add_button("Start", start)
frame.add_button("Stop", stop)
frame.add_label("")
frame.add_button("Reset", reset)
frame.set_draw_handler(draw)

# Start the frame animation
frame.start()
timer.start()
