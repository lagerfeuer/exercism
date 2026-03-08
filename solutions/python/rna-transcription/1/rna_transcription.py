def to_rna(dna_strand):
    rna_list = []
    mapping = { 'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U' }
    if not all(c in mapping.keys() for c in dna_strand):
        return ''
    for c in list(dna_strand):
        rna_list.append(mapping[c])

    return "".join(rna_list)