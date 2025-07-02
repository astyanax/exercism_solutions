from math import factorial

def rows(n: int) -> list[list[int]]:
    if n < 0:
        raise ValueError("number of rows is negative")
    if n == 0:
        return []

    return rows(n - 1) + [[int(factorial(n - 1) / (factorial(n - 1 - j) * factorial(j))) for j in range(0, n)]]