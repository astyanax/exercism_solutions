namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc roll {sides} {
        expr {1 + int($sides * rand())}
    }

    proc modifier {score} {
        expr {int(floor(($score - 10) / 2.0))}
    }

    proc ability {} {
        set dice [list [roll 6] [roll 6] [roll 6] [roll 6]]
        set sum [::tcl::mathop::+ {*}$dice]
        set min [::tcl::mathfunc::min {*}$dice]
        expr {$sum - $min}
    }

    proc character {} {
        set abilities [list strength dexterity constitution intelligence wisdom charisma]

        set char [dict create]

        foreach c $abilities {
            dict set char $c [ability]
        }

        set hp [expr {10 + [modifier [dict get $char constitution]]}]
        dict set char hitpoints $hp

        return $char
    }

}
