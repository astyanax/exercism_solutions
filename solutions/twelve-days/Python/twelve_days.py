# Using gift phrases, we'll cheat by already containing the separators and the 'and' instead of building them dynamically
ordinal = ['first','second','third','fourth','fifth','sixth','seventh','eighth','ninth','tenth','eleventh','twelfth']

gift = ['twelve Drummers Drumming, ', 'eleven Pipers Piping, ', 'ten Lords-a-Leaping, ', 'nine Ladies Dancing, ', 'eight Maids-a-Milking, ', 'seven Swans-a-Swimming, ', 'six Geese-a-Laying, ', 'five Gold Rings, ', 'four Calling Birds, ', 'three French Hens, ', 'two Turtle Doves, ', 'a Partridge in a Pear Tree.']

def verse(i):
    header = f"On the {ordinal[i-1]} day of Christmas my true love gave to me: "
    gifts = "".join(gift[-i:-1])
    return f"{header}{gifts}{'and ' if i > 1 else ''}{gift[11]}"

def recite(start_verse, end_verse):
    return [verse(n) for n in range(start_verse, end_verse+1)]