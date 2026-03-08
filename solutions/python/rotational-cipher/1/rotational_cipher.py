def rotate(msg, offset):
    msg_rotated = []
    from string import ascii_lowercase as lc, ascii_uppercase as uc
    rot = str.maketrans(lc + uc, lc[offset:] + lc[:offset] + uc[offset:] + uc[:offset])
    for c in msg:
        if c in lc + uc:
            msg_rotated.append(c.translate(rot))
        else:
            msg_rotated.append(c)
    return ''.join(msg_rotated)