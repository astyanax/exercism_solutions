from string import ascii_lowercase

def is_pangram(sentence):
    letters = set(ascii_lowercase)
    for l in sentence.lower():
        letters.discard(l)
    return len(letters) == 0
