def north(row, column):
    return row-1, column

def east(row, column):
    return row, column+1
    
def south(row, column):
    return row+1, column
    
def west(row, column):
    return row, column-1

def northeast(row, column):
    return row-1, column+1

def southeast(row, column):
    return row+1, column+1
    
def southwest(row, column):
    return row+1, column-1
    
def northwest(row, column):
    return row, column-1

def is_blocked(direction, *args):
    row = direction(*args)[0]
    column = direction(*args)[1]
    if 0 > row or row > 20 or 0 > column or column > 20:
        return True
    else:
        return False

def move_4(heading, row, col, grid):
    factors = []
    for i in range(4):                    
        if is_blocked(heading, row, col):
            return []
        else:                        
            factors.append(grid[row][col])
       #     print 'factors:', factors
            position = heading(row, col)
            row = position[0]
            col = position[1]
    return factors

def list_prod(list):
    if list == []:
        return 0
    else:
        result = list.pop()
        for i in list:
             result *= i
    return result


def p11():
    grid = []
    direction = [north, northeast, east, southeast, south, southwest, west, northwest]
    prodA = 0
    prodB = 0

    for i, line in enumerate(open("11 grid.txt")):
        gridline = tuple(int(n) for n in line.split())
        grid.append(gridline)
#    print grid
    for i in range(20):
#        print 'i:', i
        for j in range(20):
 #           print 'j:', j
            for heading in direction:
 #               print 'heading:', heading
                row = i
                col = j
                factors = move_4(heading, row, col, grid)
 #               print 'factors:', factors
                prodB = list_prod(factors)
                if prodB > prodA:
                    prodA = prodB
 #                   print 'sumA:', sumA
                    prodB = 0
    return prodA

#is_blocked(east, 20,20)

print p11()

