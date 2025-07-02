def is_isogram(string):
    clean = ''.join(x for x in string if x.isalpha()).casefold()
    return len(clean) == len(set(clean))
