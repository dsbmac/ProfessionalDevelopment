def make_bricks(small, big, goal):
    if goal <= small + big * 5:
        if goal % 5 <= small:
            return True
  
  
 
    return False

print make_bricks(3, 1, 8)
