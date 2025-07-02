<?php

declare(strict_types=1);

class PizzaPi
{
    public function calculateDoughRequirement($pizza, $person): int
    {
        return $pizza * (($person * 20) + 200);
    }

    public function calculateSauceRequirement($pizza, $volume): int
    {
        return ($pizza * 125) / $volume;
    }

    public function calculateCheeseCubeCoverage($length, $thickness, $diameter): int
    {
        return (int)(pow($length, 3) / ($thickness * pi() * $diameter));
    }

    public function calculateLeftOverSlices($pizzas, $friends): int
    {
        return (int)($pizzas * 8 % $friends);
    }
}
