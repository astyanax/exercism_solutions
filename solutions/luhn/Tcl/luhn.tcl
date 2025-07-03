proc luhn {number} {
    if [regexp {[^0-9\s]} $number] { return false }
    set digits [regexp -all -inline {[0-9]} $number]
    if {[llength $digits] <= 1} { return false }

    foreach {a b} [lreverse $digits] {
        incr checksum $a
        if {$b ne ""} {
            set b [expr {$b * 2}]
            if {$b > 9} { incr b -9 }
            incr checksum $b
        }
    }
    return [expr {$checksum % 10 == 0}]
}