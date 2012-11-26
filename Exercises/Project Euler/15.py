def move(direction, position):
    if direction == 'down':
        return position[0], position[1] + 1
    elif direction == 'right':
        return position[0] + 1, position[1]
    else:
        return None, None
           
def is_in_bounds(position, size):
    return (0 <= position[0] and position[0] < size) and (0 <= position[1] and position[1] < size)

##def is_backtrack(position, path):
##    return position in path
    
def is_valid_position(position, size, path):
    return is_in_bounds(position, size)

def is_finished_path(position, size):
    return position[0] == size - 1 and position[1] == size - 1 


def p15():
    grid = 4
    size = grid + 1
    paths = []
    compass = ['down', 'right']
    position = (0,0)
    finishedPaths = 0
    paths = [[position]]

    while paths != []:
#        print 'paths:', paths
        path = paths.pop()  #decrementor
#        print 'path:', path
        position = path[-1]
#        print 'position:', position
        for direction in compass:
            newPosition  = move(direction, position)
#            print 'newPosition:', newPosition
            if is_valid_position(newPosition, size, path):
                if is_finished_path(newPosition, size):
                    finishedPaths +=1
                else:
                    newPath = path[:]
                    newPath.append(newPosition)
                    paths.append(newPath)
                    print 'newPath:', newPath
                    print 'number of paths:', len(paths)
                    
    return finishedPaths            

print p15()

##start at starting position
##if position is not dictionary add it
##else:
##    traverse directions
##    if valid check if new position is in dictionary
##      if not then add it to the dictionary
##      if yes then nothing
##      add 1 to the original key value

