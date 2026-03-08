def is_isogram(word):
    letters = {}
    for x in word:
        if x.isalpha() and x.lower() in letters:
            return False
        letters[x.lower()] = True
    return True