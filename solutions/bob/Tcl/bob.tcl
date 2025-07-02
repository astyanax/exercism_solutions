proc heyBob {remark} {
    set remark [string trim $remark]
    if {$remark eq ""} {
        return "Fine. Be that way!"
    }

    set is_question [string match {*\?} $remark]
    set is_shouting [expr { [regexp {[[:upper:]]} $remark] && ![regexp {[[:lower:]]} $remark] }]
    if {$is_question && $is_shouting} {
        return "Calm down, I know what I'm doing!"
    }
    if {$is_question} {
        return "Sure."
    }
    if {$is_shouting} {
        return "Whoa, chill out!"
    }
    return "Whatever."
}