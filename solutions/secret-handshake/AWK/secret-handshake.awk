{
    res = ""

    if ($0 >= 16) { reverse = 1; $0 -= 16 }
    if ($0 >=  8) { secret[4] = "jump"; $0 -= 8 }
    if ($0 >=  4) { secret[3] = "close your eyes"; $0 -= 4 }
    if ($0 >=  2) { secret[2] = "double blink"; $0 -= 2 }
    if ($0 >=  1) { secret[1] = "wink" }

    for (i in secret) {
        if (reverse) {
            res = secret[i] "," res
        } else {
            res = res "," secret[i]
        }
    }

    # Remove leading comma
    if (substr(res, 1, 1) == ",") {
        res = substr(res, 2)
    }

    # Remove trailing comma
    if (substr(res, length(res), 1) == ",") {
        res = substr(res, 1, length(res) - 1)
    }

    print res
}
