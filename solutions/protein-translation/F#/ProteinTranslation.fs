module ProteinTranslation

let rec private doProteins (rna: string) (proteins: string list): string list =
    if   rna.StartsWith("AUG") then doProteins (rna.[3..]) ("Methionine"    :: proteins)
    elif rna.StartsWith("UUC") then doProteins (rna.[3..]) ("Phenylalanine" :: proteins)
    elif rna.StartsWith("UUU") then doProteins (rna.[3..]) ("Phenylalanine" :: proteins)
    elif rna.StartsWith("UUA") then doProteins (rna.[3..]) ("Leucine"       :: proteins)
    elif rna.StartsWith("UUG") then doProteins (rna.[3..]) ("Leucine"       :: proteins)
    elif rna.StartsWith("UCU") then doProteins (rna.[3..]) ("Serine"        :: proteins)
    elif rna.StartsWith("UCC") then doProteins (rna.[3..]) ("Serine"        :: proteins)
    elif rna.StartsWith("UCA") then doProteins (rna.[3..]) ("Serine"        :: proteins)
    elif rna.StartsWith("UCG") then doProteins (rna.[3..]) ("Serine"        :: proteins)
    elif rna.StartsWith("UAU") then doProteins (rna.[3..]) ("Tyrosine"      :: proteins)
    elif rna.StartsWith("UAC") then doProteins (rna.[3..]) ("Tyrosine"      :: proteins)
    elif rna.StartsWith("UGU") then doProteins (rna.[3..]) ("Cysteine"      :: proteins)
    elif rna.StartsWith("UGC") then doProteins (rna.[3..]) ("Cysteine"      :: proteins)
    elif rna.StartsWith("UGG") then doProteins (rna.[3..]) ("Tryptophan"    :: proteins)
    elif rna.StartsWith("UAA") then List.rev proteins
    elif rna.StartsWith("UAG") then List.rev proteins
    elif rna.StartsWith("UGA") then List.rev proteins
    elif rna = ""             then List.rev proteins
    else failwith "Unknown coding"

let proteins (rna: string): string list =
    doProteins rna []
