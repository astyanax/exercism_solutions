import re

def abbreviate(words):
    abbr = [w[0].upper() for w in re.findall(r"[a-zA-Z']+", words)]
    return ''.join(abbr)