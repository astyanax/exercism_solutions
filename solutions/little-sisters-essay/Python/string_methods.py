def capitalize_title(title):
    """

    :param title: str title string that needs title casing
    :return:  str title string in title case (first letters capitalized)
    """
    # return title.title()
    return ' '.join(word.capitalize() for word in title.split())


def check_sentence_ending(sentence):
    """

    :param sentence: str a sentence to check.
    :return:  bool True if punctuated correctly with period, False otherwise.
    """

    #return sentence.endswith('.')
    return sentence[-1:] == '.'


def clean_up_spacing(sentence):
    """

    :param sentence: str a sentence to clean of leading and trailing space characters.
    :return: str a sentence that has been cleaned of leading and trailing space characters.
    """

    #return sentence.strip()
    s=0
    e=len(sentence)
    while sentence[s] == " ":
        s += 1
    if sentence[-1:] == " ":
        e = -1
    while sentence[e:] == " ":
        e -= 1
    #print(f"{s},{e} ** {sentence[s:e]}")
    return sentence[s:e]


def replace_word_choice(sentence, old_word, new_word):
    """

    :param sentence: str a sentence to replace words in.
    :param old_word: str word to replace
    :param new_word: str replacement word
    :return:  str input sentence with new words in place of old words
    """

    return sentence.replace(old_word, new_word)
