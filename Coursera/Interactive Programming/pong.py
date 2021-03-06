# Implementation of classic arcade game Pong

import simplegui
import random

# initialize globals - pos and vel encode vertical info for paddles
WIDTH = 600
HEIGHT = 400       
BALL_RADIUS = 20
PAD_WIDTH = 8
PAD_HEIGHT = 80
PADDLE_SPEED = ( HEIGHT / PAD_HEIGHT ) * 2
HALF_PAD_WIDTH = PAD_WIDTH / 2
HALF_PAD_HEIGHT = PAD_HEIGHT / 2
SPACE = 20

time = 0
startNextRound = 9999999
timeout = False
right = False
ball_pos = []
ball_vel = []
paddle1_vel, paddle2_vel = 0, 0
locked = []
score1, score2 = 0, 0

# helper function that spawns a ball, returns a position vector and a velocity vector
# if right is True, spawn to the right, else spawn to the left

def restart():
    global score1, score2, right
    right = False
    score1, score2 = 0, 0    
    init()
    
def ball_init():
    global ball_pos, ball_vel # these are vectors stored as lists
    ball_pos = [WIDTH/2, HEIGHT/2]
    x_vel = random.randrange(4, 6) * random.choice([-1, 1])
    y_vel = random.randrange(3, 5) * random.choice([-1, 1])
    if right and x_vel < 0:
        x_vel *= -1
    elif x_vel > 0:
        x_vel *= -1
    ball_vel = [x_vel, y_vel]

def paddle_init():
    global paddle1_pos, paddle2_pos, paddle1_vel, paddle2_vel  # these are floats
    paddle1_pos = [0, HEIGHT / 2 - HALF_PAD_HEIGHT]
    paddle2_pos = [WIDTH - 1 - PAD_WIDTH, HEIGHT / 2 - HALF_PAD_HEIGHT]
    paddle1_vel, paddle2_vel = 0, 0
    
def update_paddles():
    global paddle1_vel, paddle2_vel
    
    if not locked[0]:        
        newPos = paddle1_pos[1] + paddle1_vel
        if 0 >= newPos:
            paddle1_pos[1] = 0
        elif HEIGHT - PAD_HEIGHT - 1 <= newPos:
            paddle1_pos[1] = HEIGHT - PAD_HEIGHT
        else:
            paddle1_pos[1] = newPos
    if not locked[1]:
        newPos = paddle2_pos[1] + paddle2_vel
        if 0 >= newPos:
            paddle2_pos[1] = 0
        elif HEIGHT - PAD_HEIGHT - 1 <= newPos:
            paddle2_pos[1] = HEIGHT - PAD_HEIGHT
        else:
            paddle2_pos[1] = newPos
            
def draw_paddles(paddle_pos, c):
    pt2 = paddle_pos[0], paddle_pos[1] + PAD_HEIGHT
    pt3 = pt2[0] + PAD_WIDTH, pt2[1]
    pt4 = pt3[0], paddle_pos[1]
    c.draw_polygon([paddle_pos, pt2, pt3, pt4], 1, "Yellow", "Yellow")

def collide():
    speedup = 0.3
    ball_vel[0] *= - (1 + speedup)    
    
def update_ball():
    global ball_pos, ball_vel, locked, score1, score2, timeout, startNextRound, right
    
    gutter = False
    if ball_pos[0] <= BALL_RADIUS + 2 + PAD_WIDTH and not locked[0]:
        gutter = True
        if (ball_pos[1] < paddle1_pos[1] - SPACE) or (ball_pos[1] > paddle1_pos[1] + PAD_HEIGHT + SPACE):
            paddle1_vel = 0
            locked[0] = True        
            score2 += 1
            right = True
    if ball_pos[0] >= WIDTH - 1 - (BALL_RADIUS + PAD_WIDTH) and not locked[1]:
        gutter = True
        if (ball_pos[1] < paddle2_pos[1] - SPACE) or (ball_pos[1] > paddle2_pos[1] + PAD_HEIGHT + SPACE):
            paddle2_vel = 0
            locked[1] = True        
            score1 += 1
            right = False
        
    if (locked[0] or locked[1]) and not timeout: 
        ball_vel = [0, 0]             
        startNextRound = time + 20
        timeout = True        
        
    if gutter: collide()
        
    #top & bottom collisions
    if ball_pos[1] <= BALL_RADIUS \
    or ball_pos[1] >= HEIGHT - 1 - BALL_RADIUS:
        ball_vel[1] *= -1

# define event handlers
def init():
    global locked, startNextRound, time, timeout  # these are ints
    startNextRound = 9999999
    timeout = False
    time = 0 
    locked = [False, False]
    ball_init()
    paddle_init()
    timer.start()
    pass

def tick():
    global time
    time += 1
    if startNextRound <= time: init()

def draw(c):    
    global score1, score2, paddle1_pos, paddle2_pos, ball_pos, ball_vel
    
    # update paddle's vertical position, keep paddle on the screen
    update_paddles()

    # draw mid line and gutters
    c.draw_line([WIDTH / 2, 0],[WIDTH / 2, HEIGHT], 1, "White")
    c.draw_line([PAD_WIDTH, 0],[PAD_WIDTH, HEIGHT], 1, "White")
    c.draw_line([WIDTH - PAD_WIDTH, 0],[WIDTH - PAD_WIDTH, HEIGHT], 1, "White")
    
    # draw paddles
    draw_paddles(paddle1_pos, c)
    draw_paddles(paddle2_pos, c)
    
    # update ball
    update_ball()    
        
    ball_pos[0] += ball_vel[0] 
    ball_pos[1] += ball_vel[1]
            
    # draw ball and scores
    c.draw_circle(ball_pos, BALL_RADIUS, 1, "White", "White")
    c.draw_text(str(score1), (WIDTH / 4 , HEIGHT / 6), 20, "Yellow")
    c.draw_text(str(score2), (WIDTH / 4 * 3, HEIGHT / 6), 20, "Yellow")
    

        
def keydown(key):    
    global paddle1_vel, paddle2_vel
    if not locked[0]:
        if key == simplegui.KEY_MAP["w"]:
            paddle1_vel = -PADDLE_SPEED
        if key == simplegui.KEY_MAP["s"]:
            paddle1_vel = PADDLE_SPEED
    if not locked[1]:
        if key == simplegui.KEY_MAP["up"]:
            paddle2_vel = -PADDLE_SPEED
        if key == simplegui.KEY_MAP["down"]:
            paddle2_vel = PADDLE_SPEED
def keyup(key):
    global paddle1_vel, paddle2_vel
    paddle1_vel = 0
    paddle2_vel = 0

# create frame
frame = simplegui.create_frame("Pong", WIDTH, HEIGHT)
frame.set_draw_handler(draw)
frame.set_keydown_handler(keydown)
frame.set_keyup_handler(keyup)
frame.add_button("Restart", restart, 100)

timer = simplegui.create_timer(100, tick)


# start frame
init()
frame.start()


