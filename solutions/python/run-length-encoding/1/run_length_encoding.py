def decode(string):
    if not string:
        return ''
    decoded_list = []
    curr_digits = []
    for c in string:
        if c.isdigit():
            curr_digits.append(c)
        else:
            decoded_list.append(c * int("".join(curr_digits))
                if curr_digits else c)
            curr_digits = []
    return "".join(decoded_list)


def encode(string):
    if not string:
        return ''
    encoded_list = []
    prev = string[0]
    curr_cnt = 1
    for c in string[1:] + '#':
        if prev == c:
            curr_cnt += 1
        else:
            encoded_list.append((str(curr_cnt) if curr_cnt > 1 else '') + prev)
            curr_cnt = 1
        prev = c
    return "".join(encoded_list)