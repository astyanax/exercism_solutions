def is_paired(input_string):
    symbols = "".join(c for c in input_string if c in "{}[]()")
    while (pair := next((pair for pair in ("{}", "[]", "()") if pair in symbols), False)):
        symbols = symbols.replace(pair, "")
    return not symbols