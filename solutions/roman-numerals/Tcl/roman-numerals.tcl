proc toroman {n} {
    set res ""
    set roman_numerals {M 1000 CM 900 D 500 CD 400 C 100 XC 90 L 50 XL 40 X 10 IX 9 V 5 IV 4 I 1}

    foreach {rom dec} $roman_numerals {
        append res [string repeat $rom [expr $n / $dec]]
        set n [expr $n % $dec]
    }
    return $res
}