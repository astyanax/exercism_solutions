import re

def abbreviate(words):
    actual_words = re.findall(r"[a-zA-Z']+", words)
    abbreviations = list()
    for w in actual_words:
        abbreviations.append(w[0].upper())
    return ''.join(abbreviations)