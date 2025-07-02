{
    # Initialize the code variable
    code = ""

    # Check the input value and assign actions accordingly
    if ($0 >= 16) { reverse = 1; $0 -= 16 }
    if ($0 >= 8) { secret[4] = "jump"; $0 -= 8 }
    if ($0 >= 4) { secret[3] = "close your eyes"; $0 -= 4 }
    if ($0 >= 2) { secret[2] = "double blink"; $0 -= 2 }
    if ($0 >= 1) { secret[1] = "wink" }

    # Build the code string based on the reverse flag
    for (i in secret) {
        if (reverse) {
            code = secret[i] "," code
        } else {
            code = code "," secret[i]
        }
    }

    # Remove leading comma
    if (substr(code, 1, 1) == ",") {
        code = substr(code, 2)
    }

    # Remove trailing comma
    if (substr(code, length(code), 1) == ",") {
        code = substr(code, 1, length(code) - 1)
    }

    # Print the final code
    print code
}
