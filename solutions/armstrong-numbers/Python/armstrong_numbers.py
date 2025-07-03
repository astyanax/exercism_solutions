from math import log10
def is_armstrong_number(number):
    if number < 0: return False
    if number == 0: return True
    n_digits = int(log10(number)) + 1
    return number == sum(((number // 10**k % 10)**n_digits for k in range(n_digits)))