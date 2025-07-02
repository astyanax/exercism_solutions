import re

def abbreviate(words):
    abbr = [w[0].upper() for w in re.sub(r'[^a-zA-Z\s\']', ' ', words).split()]
    return ''.join(abbr)