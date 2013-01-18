import math
import copy

class Point(object):
        """Represents a point in 2d space"""

def print_point(point):
        print  '(%g, %g)' % (point.x, point.y)

def distance_between_points(pt1, pt2):
        #a2 + b2 = c2
        a = pt2.x - pt1.x
        b = pt2.y - pt1.y
        return math.sqrt(a**2 + b**2)

a = Point()
b = Point()
a.x = 0.0
a.y = 0.0
b.x = 5.0
b.y = 10.0


class Rectangle(object):
        pass

def find_cent(rect):
        p = Point()
        p.x = rect.corner.x + rect.width/2.0
        p.y = rect.corner.y + rect.height/2.0
        return p

box = Rectangle()
box.width = 10.0
box.height = 20.0
box.corner = Point()
box.corner.x = 0.0
box.corner.y = 0.0

center = find_cent(box)
print_point(center)


        

