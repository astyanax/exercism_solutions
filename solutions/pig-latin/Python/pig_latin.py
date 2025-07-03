def piggyfy(word):
    while not word[0] in 'aeiou':
        if word[0] in 'xy' and not word[1] in 'aeiou':
            break
        word = word[1:] + word[0]
        if word[-1] == 'q' and word[0] == 'u':
            word = word[1:] + 'u'
    return word + 'ay'

def translate(text):
    return ' '.join([piggyfy(word) for word in text.split()])