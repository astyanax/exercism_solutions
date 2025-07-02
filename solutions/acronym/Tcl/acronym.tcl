proc abbreviate {phrase} {
    regsub -all {[^a-zA-Z \-]+} $phrase {} clean_phrase
    set tokens [split [string toupper $clean_phrase] " -"]

    set res ""
    foreach w $tokens {
        append res [string range $w 0 0]
    }
    return $res
}
