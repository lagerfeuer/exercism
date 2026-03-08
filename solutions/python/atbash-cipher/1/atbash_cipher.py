import string
atbash = str.maketrans(string.ascii_lowercase, string.ascii_lowercase[::-1])
punctuation = str.maketrans(string.punctuation, ' ' * len(string.punctuation))

def encode(plain_text):
    plain_text = plain_text.lower().translate(punctuation).replace(' ', '')
    idx = 1
    cipher = []
    for c in plain_text.translate(atbash):
        cipher.append(c)
        if idx % 5 == 0:
            cipher.append(' ')
        idx += 1
    return ''.join(cipher) if cipher[-1] != ' ' else ''.join(cipher[:-1])

def decode(ciphered_text):
    ciphered_text = ciphered_text.replace(' ', '')
    return ciphered_text.translate(atbash)