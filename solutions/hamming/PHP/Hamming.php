<?php

declare(strict_types=1);

function distance(string $strandA, string $strandB): int
{
    if (strlen($strandA) !== strlen($strandB)) {
        throw new InvalidArgumentException("DNA strands must be of equal length.");
    }

    $dist = 0;
    foreach (mb_str_split($strandA) as $i => $cA) {
        if ($strandB[$i] != $cA) {
            $dist++;
        }
    }
    return $dist;
}
