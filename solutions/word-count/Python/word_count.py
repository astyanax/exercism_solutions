from collections import Counter
import re

def count_words(sentence):
    clean_text = re.findall("[a-z]+'[a-z]+|[a-z]+|\d", sentence.lower())
    #return {word : clean_text.count(word) for word in clean_text}
    return Counter(clean_text)