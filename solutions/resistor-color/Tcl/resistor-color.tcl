namespace eval resistorColor {
    variable colours [dict create {*}{
        black  0
        brown  1
        red    2
        orange 3
        yellow 4
        green  5
        blue   6
        violet 7
        grey   8
        white  9
    }]

    proc colorCode {args} {
        variable colours
        if {[dict exists $colours $args]} {
            return [dict get $colours $args]
        }
        error "Invalid color: $args"
    }

    proc colors {args} {
        variable colours
        dict keys $colours
    }
}