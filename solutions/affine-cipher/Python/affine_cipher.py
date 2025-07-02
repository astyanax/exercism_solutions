import math

_oa = ord('a')
CHUNK_SIZE = 5

def coprime_check(f):
    def _f(*args, **kwargs):
        print(kwargs)
        if math.gcd(args[1], 26) > 1:
            raise ValueError("a and m must be coprime.")
        return f(*args, **kwargs)
    return _f

@coprime_check
def encode(plain_text, a, b):
    enc = lambda x, a, b: (a * x + b) % 26
    clean = lambda c: [c.lower() for c in plain_text if c.isalnum()]

    chunks = ''.join( chr( _oa + enc( ord(c) - _oa, a, b) ) if c.isalpha() else c for c in clean(plain_text))
    return ' '.join(chunks[i: i+CHUNK_SIZE] for i in range(0, len(chunks), CHUNK_SIZE))


@coprime_check
def decode(ciphered_text, a, b):
    dec = lambda y, a, b: (pow(a, -1, 26) * (y - b)) % 26
    clean = lambda c: [c.lower() for c in ciphered_text if c.isalnum()]

    return ''.join(chr(dec(ord(c) - _oa, a, b) + _oa) if c.isalpha() else c for c in clean(ciphered_text))