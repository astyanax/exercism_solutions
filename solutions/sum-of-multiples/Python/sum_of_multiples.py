def sum_of_multiples(limit, multiples):
    return sum({x for d in multiples if d for x in range(d, limit, d)})