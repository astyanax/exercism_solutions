from string import ascii_letters, punctuation
CHUNK = 5

def regroup_five(string):
    separated_string = [string[index:index+CHUNK] for index in range(0,len(string),CHUNK)]
    return " ".join(separated_string)

def encode(plain_text):
    atbash_cipher = plain_text.maketrans(ascii_letters, "zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcba", punctuation)
    return regroup_five(plain_text.translate(atbash_cipher).replace(" ", ""))

def decode(ciphered_text):
    atbash_decipher = ciphered_text.maketrans("zyxwvutsrqponmlkjihgfedcba","abcdefghijklmnopqrstuvwxyz")
    return ciphered_text.translate(atbash_decipher).replace(" ", "")