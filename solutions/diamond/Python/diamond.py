from string import ascii_uppercase

def rows(letter):
    # Generate the list of letters required
    alphabet = ascii_uppercase[:ascii_uppercase.index(letter)+1]
    # Create the ascending list of letters by getting the first letter-1 chars, then reversing the alphabet
    print_line = alphabet[:-1] + alphabet[::-1]
    # Generate the inverse/mirrored version of the print_line
    diamond_line = alphabet[::-1] + alphabet[1:]
    # Use spaces for each line, unless the lines match (i.e. where characters should be used)
    return [''.join(x if x == y else ' ' for y in diamond_line) for x in print_line]
