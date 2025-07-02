proc keep {varname list condition} {
    set new [list]
    foreach $varname $list {
        if { [eval $condition] } {
            lappend new [subst $$varname]
        }
    }
    return $new
}

proc discard {varname list condition} {
    set new [list]
    foreach $varname $list {
        if { [eval $condition] } { continue }
        lappend new [subst $$varname]
    }
    return $new
}
