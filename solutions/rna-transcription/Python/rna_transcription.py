def to_rna(dna_strand: str):
    protein_transcription = str.maketrans("GCTA", "CGAU")
    return dna_strand.translate(protein_transcription)