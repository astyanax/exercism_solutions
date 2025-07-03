def factors(n):
    if n < 2:
        return []

    def factor_check(factors, n, div):
        while n % div == 0:
            factors.append(div)
            n /= div
        return factors, n
    
    factors = []

    # Implement sieve logic for known primes
    for div in (2, 3, 5, 7, 11, 13):
        factors, n = factor_check(factors, n, div)

    # Proceed with 6k+-1 possible divisors
    for k in range(18, int(n**0.5) + 1, 6):
        factors, n  = factor_check(factors, n, k-1)
        factors, n  = factor_check(factors, n, k+1)

    # Append potential leftover factor past the square root
    if n > 1:
        factors.append(n)

    return factors