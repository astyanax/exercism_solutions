#!/usr/bin/env tclsh

proc factors {n} {
    set factors {}
    set potential_divisor 2

    while {$n > 1} {
        while {$n % $potential_divisor == 0} {
            lappend factors $potential_divisor
            set n [expr {$n / $potential_divisor}]
        }
        incr potential_divisor 1
    }

    return $factors
}
