import math

def largest_product(series, size):
    if size == 0:
        return 1
    if size < 0:
        raise ValueError('span must not be negative')
    if size > len(series):
        raise ValueError('span must be smaller than string length')
    if not series.isdigit():
        raise ValueError('digits input must only contain digits')

    return max([math.prod([int(x) for x in series[i:i+size]]) for i in range(len(series) - size + 1)])