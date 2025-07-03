proc raindrops {number} {
    set fizzbuzz {3 Pling 5 Plang 7 Plong}

    set res ""
    dict for {divisor sound} $fizzbuzz {
        if {$number % $divisor == 0} {
            append res $sound
        }
    }
    if { $res == "" } {
        set res $number
    }
    return $res
}