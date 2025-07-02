import re

def abbreviate(words):
    actual_words = re.findall(r"[a-zA-Z']+", words)
    abbr = list()
    for w in actual_words:
        abbr.append(w[0].upper())
    return ''.join(abbr)