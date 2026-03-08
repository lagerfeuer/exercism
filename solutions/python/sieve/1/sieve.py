def sieve(limit):
    start = 2
    end = limit + 1
    numbers = { x: True for x in range(start, end) }
    for i in range(start, end):
        idx = 2
        while idx * i <= limit:
            numbers[idx * i] = False
            idx += 1
    return [ x for x in numbers.keys() if numbers[x] ]