proc diamond {letter} {
  variable a [ord A]
  variable n [expr {[ord $letter] - $a + 1}]
  variable template [string repeat " " $n]
  variable top [list]
  for {set i 0} {$i < $n} {incr i} {
    variable c [chr [expr {$a + $i}]]
    variable right [string replace $template $i $i $c]
    variable left [string reverse [string range $right 1 end]]
    lappend top $left$right
  }
  variable bottom [lreverse [lrange $top 0 end-1]]
  join [list {*}$top {*}$bottom] \n
}

proc ord {c} { scan $c %c }
proc chr {i} { format %c $i }
