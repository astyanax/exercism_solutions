def factors(n):
    factors = []
    if n < 2:
        return []

    # Implement sieve logic for known primes
    for div in (2, 3, 5, 7):
        while n % div == 0:
            factors.append(div)
            n /= div

    # Proceed with 6k+-1 possible divisors
    for k in range(12, int(n**0.5) + 1, 6):
        for div in [k-1, k+1]:
            while n % div == 0:
                factors.append(div)
                n /= div

    # Append potential leftover factor past the square root
    if n > 1:
        factors.append(n)

    return factors  