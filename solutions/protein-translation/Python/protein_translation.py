def proteins(strand: str) -> list[str]:
    codons = {
        "AUG": "Methionine", "UUU": "Phenylalanine", "UUC": "Phenylalanine",
        "UUA": "Leucine", "UUG": "Leucine", "UCU": "Serine", "UCC": "Serine",
        "UCA": "Serine", "UCG": "Serine", "UAU": "Tyrosine", "UAC": "Tyrosine",
        "UGU": "Cysteine", "UGC": "Cysteine", "UGG": "Tryptophan"
    }
    stops = {"UAA", "UAG", "UGA"}
    
    protein_list = []
    for i in range(0, len(strand), 3):
        codon = strand[i:i+3]
        if codon in stops:
            break
        if codon in codons:
            protein_list.append(codons[codon])
    
    return protein_list