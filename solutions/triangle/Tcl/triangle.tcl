namespace eval triangle {
    proc is {type sides} {
        lassign [lsort $sides] a b c

        if { $a <= 0 || $c >= $a + $b } {
            return false
        }
        set unique_sides [llength [lsort -unique $sides]]
        
        switch -exact -- $type {
            equilateral {return [expr {$unique_sides == 1}]}
            isosceles   {return [expr {$unique_sides <= 2}]}
            scalene     {return [expr {$unique_sides == 3}]}
            default     {error "invalid type: $type"}
        }
    }
}
