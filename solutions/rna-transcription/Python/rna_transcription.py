def to_rna(dna_strand: str):
    rna = ""
    for i in dna_strand:
        if i == 'G':
            i = 'C'
        elif i == 'C':
            i = 'G'
        elif i == 'T':
            i = 'A'
        elif i == 'A':
            i = 'U'
        else:
            i = ''
        rna += i
    return rna