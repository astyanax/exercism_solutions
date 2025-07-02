actions = {
    0b0001 : "wink",
    0b0010 : "double blink",
    0b0100 : "close your eyes",
    0b1000 : "jump"
}

def commands(binary_str):
    input = int(binary_str, 2)
    code = [actions[i] for i in actions if i & input]
    if input & 0b10000: code.reverse()
    return code