""""Checks if the 3 sides form a valid triangle."""

#class InvalidTriangle(Exception):
#    pass

def valid_triangle(f):
    def check(sides):
        if not all(sides) or not all(side * 2 < sum(sides) for side in sides):
            return False
        return f(sides)
    return check

@valid_triangle    
def equilateral(sides):
    return len({*sides}) == 1

@valid_triangle
def isosceles(sides):
    return len({*sides}) <= 2

@valid_triangle
def scalene(sides):
    return len({*sides}) == 3
