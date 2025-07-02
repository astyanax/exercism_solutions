{
    gsub(/[^a-zA-Z]/, "")
    input = tolower($0)
    split(input, chars, "")
    found[0] = 0
    for (i in chars) {
        c = chars[i]
        if (c in found) {
            print "false"
            exit 0
        }
        found[c] = c
    }
    print "true"
}