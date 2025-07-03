<?php

class HighSchoolSweetheart
{
    public function firstLetter(string $name): string
    {
        return mb_strimwidth(trim($name), 0, 1);
    }

    public function initial(string $name): string
    {
        return mb_strtoupper($this->firstLetter($name)) . ".";
    }

    public function initials(string $name): string
    {
        $first = $this->initial(explode(" ", $name)[0]);
        $last  = $this->initial(explode(" ", $name)[1]);
        return "$first $last";        
    }

    public function pair(string $a, string $b): string
    {
        $sh_a = $this->initials($a);
        $sh_b = $this->initials($b);
        
        return <<<EXPECTED_HEART
                 ******       ******
               **      **   **      **
             **         ** **         **
            **            *            **
            **                         **
            **     $sh_a  +  $sh_b     **
             **                       **
               **                   **
                 **               **
                   **           **
                     **       **
                       **   **
                         ***
                          *
            EXPECTED_HEART;
    }
}
