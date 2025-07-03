def classify(number):
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")

    factors = set()
    for pos_divisor in range(1, int(number ** 0.5) + 1):
        if number % pos_divisor != 0:
            continue
        factors.add(pos_divisor)
        factors.add(number // pos_divisor)
    factors.remove(number)
    total = sum(factors)
    if total == number:
        return "perfect"
    if total > number:
        return "abundant"
    if total < number:
        return "deficient"