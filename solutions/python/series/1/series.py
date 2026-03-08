def slices(series, length):
    if len(series) < length or length == 0:
        raise ValueError("series shorter than provided length")
    slices = []
    for i in range(len(series) - length + 1):
        slices.append([int(x) for x in series[i:i + length]])
    return slices