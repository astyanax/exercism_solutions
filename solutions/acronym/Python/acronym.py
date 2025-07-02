import re

def abbreviate(words):
    abbr = [w[0] for w in re.split("[\s_\-]+", words)]
    return ''.join(abbr).upper()