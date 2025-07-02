from string import ascii_lowercase, ascii_uppercase

def rotate(text, rot):
    key = str.maketrans(ascii_lowercase + ascii_uppercase,
                        ascii_lowercase[rot:] + ascii_lowercase[:rot] +
                        ascii_uppercase[rot:] + ascii_uppercase[:rot])
    return str.translate(text, key)