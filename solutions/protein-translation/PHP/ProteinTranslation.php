<?php

declare(strict_types=1);

class ProteinTranslation
{
    public const codons = [
        "AUG" => "Methionine",
        "UUU" => "Phenylalanine",
        "UUC" => "Phenylalanine",
        "UUA" => "Leucine",
        "UUG" => "Leucine",
        "UCU" => "Serine",
        "UCC" => "Serine",
        "UCA" => "Serine",
        "UCG" => "Serine",
        "UAU" => "Tyrosine",
        "UAC" => "Tyrosine",
        "UGU" => "Cysteine",
        "UGC" => "Cysteine",
        "UGG" => "Tryptophan",
        "UAA" => "STOP",
        "UAG" => "STOP",
        "UGA" => "STOP",
    ];

    public function getProteins(string $rna): array
    {
        $results = [];
        foreach (str_split($rna, 3) as $value) {
            if ( ! in_array($value, array_keys(self::codons))) throw new InvalidArgumentException("Invalid codon");
            if ("STOP" === self::codons[$value]) break;
            $results[] = self::codons[$value];
        }
        return $results;
    }
}