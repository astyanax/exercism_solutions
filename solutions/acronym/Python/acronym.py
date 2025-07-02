import re

def abbreviate(words):
    abbr = [w[0] for w in re.sub(r'[^a-zA-Z\s\']', ' ', words).split()]
    return ''.join(abbr).upper()