from math import sqrt

# https://stackoverflow.com/a/71234817
def square_root(number):
    return sqrt(number)

def square_root_heron(number):
    guess = 0.1 + number // 2
    
    while abs(guess**2 - number) > 1e-7:
        guess = (guess + (number / guess)) / 2
    return round(guess, 0)

def square_root_binary_search(number):
    left = 0
    right = number
    while left < right:
        mid = (left + right) // 2
        if mid * mid == number:
            return mid
        elif mid * mid > number:
            right = mid
        elif mid * mid < number:
            left = mid + 1
    return left

# Takashi Kojima: Advanced Abacus - Theory and Practice
def square_root_abacus(number):
    c = 0
    d = 1 << 30

    while d:
        if number >= c + d:
            number -= c + d
            c = (c >> 1) + d
        else:
            c >>= 1
        d >>= 2
    return c

def square_root_newton(radicand):
    g0 = radicand // 2
    if g0 == 0:
        g0 = 1e-6
    g1 = (g0 + radicand // g0) // 2
    while (abs(g1 - g0) > 1e-7):
        g0 = g1
        g1 = (g0 + radicand / g0) // 2
    return g0
