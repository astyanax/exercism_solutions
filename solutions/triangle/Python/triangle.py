""""Checks if the 3 sides form a valid triangle."""

#class InvalidTriangle(Exception):
#    pass

def valid_triangle(f):
    def check(sides):
        return all(sides) and (sum(sides) >= max(sides)*2) and f(sides)
    return check


@valid_triangle    
def equilateral(sides):
    return sides[0] == sides[1] == sides[2]

@valid_triangle
def isosceles(sides):
    sides.sort()
    return (sides[0] == sides[1]) or (sides[1] == sides[2]) or (sides[0] == sides[2])

@valid_triangle
def scalene(sides):
    sides = sorted(sides)
    return sides[0] < sides[1] < sides[2]
