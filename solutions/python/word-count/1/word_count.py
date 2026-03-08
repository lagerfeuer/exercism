import re

def word_count(words):
    count = {}
    splits = re.findall("[a-z0-9]+", words.lower())
    for word in splits:
        if word in count:
            count[word] += 1
        else:
            count[word] = 1
    return count