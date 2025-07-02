from string import ascii_letters, ascii_lowercase, ascii_uppercase, whitespace, punctuation
import textwrap
CHUNK = 5
reversed_mapping = ascii_lowercase[::-1] + ascii_lowercase[::-1]

def encode(plain_text):
    atbash_cipher = plain_text.maketrans(ascii_letters, reversed_mapping, whitespace + punctuation)
    return " ".join(textwrap.wrap(plain_text.translate(atbash_cipher), CHUNK))

def decode(ciphered_text):
    atbash_decipher = ciphered_text.maketrans(ascii_lowercase[::-1], ascii_lowercase, whitespace)
    return ciphered_text.translate(atbash_decipher)