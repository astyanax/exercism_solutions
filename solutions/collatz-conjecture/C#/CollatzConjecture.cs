using System;

public static class CollatzConjecture
{
    private static int Step(int number, int step) =>
        number == 1 ? step : number % 2 == 0 ? Step(number / 2, step + 1) : Step(number * 3 + 1, step + 1);

    public static int Steps(int number) =>
        number > 0 ? Step(number, 0) : throw new ArgumentOutOfRangeException(number.ToString());
}