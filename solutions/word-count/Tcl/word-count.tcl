proc countWords {sentence} {
    set counts [dict create]

    foreach word [regexp -all -inline {[[:alnum:]']+} $sentence] {
        set w [string tolower [string trim $word {'}]]
        dict incr counts $w
    }
    return $counts
}