import re

def abbreviate(words):
    words = re.sub('[-_]', ' ', words)
    words = re.sub(' +', ' ', words)
    word_list = words.split(' ')
    abbrev = ''
    for word in word_list:
        abbrev += word.strip().upper()[0]
    return abbrev