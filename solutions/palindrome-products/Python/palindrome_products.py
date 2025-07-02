def palindromes(digits, reverse = False, add_zero = False):
    if reverse:
        outer_range = range(9, -1 if add_zero else 0, -1)
    else:
        outer_range = range(0 if add_zero else 1, 10)
    for outer in outer_range:
        if digits == 1:
            yield outer
        elif digits == 2:
            yield outer * 11
        else:
            for inner in palindromes(digits-2, reverse=reverse, add_zero=True):
                number = outer*10**(digits-1) + inner*10 + outer
                yield number

def get_factors(number, min_factor, max_factor):
    factors = []
    min_range = max(min_factor, number//max_factor)
    max_range = min(int(number**0.5), max_factor, number//min_factor) + 1
    for i in range(min_range, max_range):
        if number % i == 0:
            j = number // i
            if j < i: break
            if j >= min_factor and j <= max_factor:
                factors.append([i, j])
    return factors

def search(min_factor, max_factor, reverse = False):
    min_p, max_p = (min_factor*min_factor, max_factor*max_factor)
    min_digits, max_digits = (len(str(min_p)), len(str(max_p)))
    if reverse:
        digits_range = range(max_digits, min_digits-1, -1)
    else:
        digits_range = range(min_digits, max_digits+1)
    for digits in digits_range:
        for p in palindromes(digits, reverse=reverse):
            if p >= min_p and p <= max_p:
                factors = get_factors(p, min_factor, max_factor)
                if factors:
                    return p, factors
    return None, []

def validate_factors(f):
    def check(min_factor, max_factor):
        if min_factor > max_factor:
            raise ValueError("min must be <= max")
        return f(min_factor, max_factor)
    return check

@validate_factors
def largest(min_factor, max_factor):
    return search(min_factor, max_factor, reverse=True)

@validate_factors
def smallest(min_factor, max_factor):
    return search(min_factor, max_factor)
