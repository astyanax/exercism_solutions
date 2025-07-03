<?php

declare(strict_types=1);

class Lasagna
{
    const COOKING_TIME = 40;
    const TIME_PER_LAYER = 2;
    
    function expectedCookTime() {
        return self::COOKING_TIME;
    }

    function remainingCookTime($elapsed_minutes) {
        return self::expectedCookTime() - $elapsed_minutes;
    }

    function totalPreparationTime($layers_to_prep) {
        return self::TIME_PER_LAYER * $layers_to_prep;
    }

    function totalElapsedTime($layers_to_prep, $elapsed_minutes) {
        return self::totalPreparationTime($layers_to_prep) + $elapsed_minutes;
    }

    function alarm() {
        return "Ding!";
    }
}
