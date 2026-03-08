def detect_anagrams(word, candidates):
    match = sorted(list(word.lower()))
    matches = []
    for c in candidates:
        c_match = sorted(list(c.lower()))
        if match == c_match and word.lower() != c.lower():
            matches.append(c)
    return matches