def abbreviate(words):
    words = words.replace('-', ' ')
    word_list = words.split(' ')
    abbrev = ''
    for word in word_list:
        abbrev += word.strip().upper()[0]
    return abbrev