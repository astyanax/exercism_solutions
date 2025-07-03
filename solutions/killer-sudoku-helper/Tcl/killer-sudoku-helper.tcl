proc combinations {sum size exclude} {
    set results [dict create]

    if {$size == 1} {
        if {1 <= $sum && $sum <= 9 && $sum ni $exclude} {
            return $sum
        }
        return $results
    }

    for {set i 1} {$i < 10} {incr i} {
        if {$i ni $exclude} {
            foreach comb [combinations [expr {$sum - $i}] [expr {$size - 1}] [concat $exclude $i]] {
                dict set results [lsort [concat $comb $i]] 1
            }
        }
    }
    return [dict keys $results]
}