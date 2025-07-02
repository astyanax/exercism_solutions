import re

def is_valid(isbn):
    isbn = isbn.replace("-", "")
    if re.search(r"^[\d]{9}[\dX]$", isbn) is None:
        return False

    new_isbn = [10 if d == 'X' else int(d) for d in isbn]
    product = sum( (10-i) * d for i, d in enumerate(new_isbn))

    return product % 11 == 0