proc isIsogram {input} {
    regsub -all {[ -]} $input {} clean_text
    set total [string length $clean_text]
    set uniq [llength [lsort -nocase -unique [split $clean_text {}]]]
    return [expr {$total == $uniq}]
}