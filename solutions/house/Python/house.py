from itertools import chain, islice

phrases = (
    "that lay in, the house that Jack built.",
    "that ate, the malt",
    "that killed, the rat",
    "that worried, the cat",
    "that tossed, the dog",
    "that milked, the cow with the crumpled horn",
    "that kissed, the maiden all forlorn",
    "that married, the man all tattered and torn",
    "that woke, the priest all shaven and shorn",
    "that kept, the rooster that crowed in the morn",
    "that belonged to, the farmer sowing his corn",
    "this was, the horse and the hound and the horn",
)

def recite(start, end):
    return [verse(i) for i in range(start, end+1)]

def verse(which):
    selection = " ".join(reversed(phrases[:which])).split(",")
    return "".join(chain("This is", islice(selection, 1, None)))
