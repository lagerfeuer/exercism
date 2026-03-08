def is_pangram(sentence):
    letters = []
    for c in sentence:
        if c.isalpha() and c.lower() not in letters:
            letters.append(c.lower())
    return len(letters) == 26