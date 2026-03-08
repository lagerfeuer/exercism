def sum_of_multiples(limit, factors):
    mults = set() 
    for factor in factors:
        idx = 1
        while idx * factor < limit:
            mults.add(idx * factor)
            idx += 1
    return sum(mults) if mults else 0