{
    str = $0
    len = length(str)
    reversed = ""

    for (i = len; i >= 1; i--) {
        reversed = reversed substr(str, i, 1)
    }

    print reversed
}
