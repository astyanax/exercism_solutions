transcribe('A','U').
transcribe('T','A').
transcribe('G','C').
transcribe('C','G').

rna_transcription(Rna, Dna) :-
    string_chars(Rna, RnaAtoms),
    maplist(transcribe, RnaAtoms, DnaAtoms),
    string_chars(Dna, DnaAtoms).