# These variables are initialized on the command line (using '-v'):
# - verse
# - start
# - stop

function bottle(num) {
    if (num >= 2) return num " bottles"
    if (num == 1) return "1 bottle"
    if (num == 0) return "No more bottles"
}

function sing(line) {
    print bottle(line) " of beer on the wall, " tolower(bottle(line)) " of beer."
    if (line > 1)
        printf "Take one down and pass it around, %s of beer on the wall.\n", bottle(line - 1)
    else if (line == 1)
        print "Take it down and pass it around, no more bottles of beer on the wall."
    else
        print "Go to the store and buy some more, 99 bottles of beer on the wall."
}

BEGIN {
    if (verse != "") sing(verse)
    else for (i = start; i >= stop; i--) sing(i)
}