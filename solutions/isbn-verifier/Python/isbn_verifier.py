import re

def is_valid(isbn):
    isbn = isbn.replace("-", "")
    if re.search(r"[\d]{9}[\dX]$", isbn) is None or len(isbn) != 10:
        return False

    product = sum(factor * (10 if d == 'X' else int(d)) for factor, d in zip(range(10,0,-1), isbn))

    return product % 11 == 0