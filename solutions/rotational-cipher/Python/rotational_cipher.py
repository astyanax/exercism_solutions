from string import ascii_lowercase, ascii_uppercase

def rotate(text, key):
    rotation = str.maketrans(ascii_lowercase + ascii_uppercase,
                        ascii_lowercase[key:] + ascii_lowercase[:key] +
                        ascii_uppercase[key:] + ascii_uppercase[:key])
    return text.translate(rotation)
