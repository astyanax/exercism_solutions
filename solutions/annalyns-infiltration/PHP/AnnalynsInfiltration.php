<?php

declare(strict_types=1);

class AnnalynsInfiltration
{
    public function canFastAttack($is_knight_awake) {
        return !$is_knight_awake;
    }

    public function canSpy($is_knight_awake, $is_archer_awake, $is_prisoner_awake) {
        return $is_knight_awake || $is_archer_awake || $is_prisoner_awake;
    }

    public function canSignal($is_archer_awake, $is_prisoner_awake) {
        return $is_prisoner_awake && !$is_archer_awake;
    }

    public function canLiberate( $is_knight_awake, $is_archer_awake, $is_prisoner_awake, $is_dog_present ) {
        $cond_1 = $is_dog_present && !$is_archer_awake;
        $cond_2 = $is_prisoner_awake && !$is_archer_awake && !$is_knight_awake;
        return $cond_1 || $cond_2;
    }
}