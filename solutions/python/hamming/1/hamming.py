def distance(original, mutation):
    if len(original) != len(mutation):
        raise ValueError
    diff = 0
    for o, m in zip(original, mutation):
        if o != m:
            diff += 1
    return diff