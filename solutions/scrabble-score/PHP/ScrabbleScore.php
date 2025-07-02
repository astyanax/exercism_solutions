<?php

declare(strict_types=1);

const SCORES = [
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
];

function score(string $word): int
{
    $total = 0;
    foreach ( count_chars(strtoupper($word), 1) as $i => $count ) {
        foreach (SCORES as $alphabets => $score) {
            if (strpos($alphabets, chr($i)) !== false) {
                $total += $count * $score;
                break;
            }
        }
    }

    return $total;
}