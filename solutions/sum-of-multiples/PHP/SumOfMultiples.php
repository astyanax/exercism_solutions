<?php

declare(strict_types=1);

function sumOfMultiples(int $number, array $multiples): int
{
    if (in_array(0, $multiples) or $number < 1) return 0;
    $acc = 0;
    for ($n = 0; $n < $number; $n += 1) {
        $v = false;
        foreach ($multiples as $m) if ($m > 0 && $n % $m === 0) $v = true;
        $acc += ($v === true ? $n : 0);
    }
    return $acc;
}
