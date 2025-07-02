<?php

declare(strict_types=1);

class Triangle
{
    private array $sides;
    public function __construct(float | int ...$sides)
    {
        if ((max($sides) * 2) >= array_sum($sides)) {
            throw new InvalidArgumentException('Can not build a triangle from given sides.');
        }
        $this->sides = $sides;
    }

    public function kind(): string
    {
        $kinds = [
            1 => 'equilateral',
            2 => 'isosceles',
            3 => 'scalene'
        ];
        return $kinds[count(array_unique($this->sides))];
    }
}