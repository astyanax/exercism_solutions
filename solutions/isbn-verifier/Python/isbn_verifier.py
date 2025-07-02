import re

def is_valid(isbn):
    isbn = isbn.replace("-", "")
    if re.search(r"[\d]{9}[\dX]$", isbn) is None or len(isbn) != 10:
        return False

    factor = 10
    product = 0

    for d in isbn:
        product += factor * (10 if d == 'X' else int(d))
        factor -= 1

    return product % 11 == 0