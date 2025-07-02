import re

def abbreviate(words):
    actual_words = re.findall(r"[a-zA-Z']+", words)
    abbr = [w[0].upper() for w in actual_words]
    return ''.join(abbr)