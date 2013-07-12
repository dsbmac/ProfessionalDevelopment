# CodeSkulptor runs Python programs in your browser.
# Click the upper left button to run this simple demo.

# CodeSkulptor runs in Chrome 18+, Firefox 11+, and Safari 6+.
# Some features may work in other browsers, but do not expect
# full functionality.  It does NOT run in Internet Explorer.

import simplegui
import math

#Global state
width = 300
height = 200

#time variables
interval = 1 #timer interval
milliDivisor = 100 / interval
time = 0 #stores the time elapsed in millisecs
prevTime = -1;

#clock display
clock = '' #clock string
clockCtr = [width/2, height/2 - 15]
clockRadius = 40
splitRadius = clockRadius * 1
splitPosition = [clockCtr[0], clockCtr[1] - clockRadius]
points = milliDivisor #theta angle points

score = 0
attempts = 0
scoreboard = "Welcome!" #shows scores/attempts

#converts aggregate time into units of time
def convertToSplit(): #tenths of second
    tenths = int(time / milliDivisor * 10) % 10
    return tenths
def convertToSeconds():
    seconds = int(time / milliDivisor) % 60   
    return seconds
def convertToMinutes():
    minutes = int((time / milliDivisor)/ 60)
    return minutes
def updateClock():
    global clock
    split = str(convertToSplit())    
    seconds = ''
    secondsNum = convertToSeconds()    
    if secondsNum < 10: #leading zero
        seconds += '0'
    seconds += str(secondsNum)    
    minutes = str(convertToMinutes())
    
    moveSplitHand()    
    clock = minutes + ':' + seconds + '.' + split  
    
#scoreboard
def calculateScore():
    global score, attempts, prevTime
    split = int(convertToSplit())
    if not prevTime == time and time != 0: #checks timer is not off
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
def moveSplitHand(): #controls the split hand position
    slice = 2 * math.pi / points;
    theta = slice * ((time % points) - (points/4) );
    splitPosition[0] = clockCtr[0] + splitRadius * math.cos(theta)
    splitPosition[1] = clockCtr[1] + splitRadius * math.sin(theta)    

# Event Handlers
# Handler for tick
def tick():
    global time
    time += 1 #increments the time value
    updateClock()
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
    updateClock()

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
