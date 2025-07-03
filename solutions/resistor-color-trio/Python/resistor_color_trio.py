def label(colors):
    color_values = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    prefixes = ["", "kilo", "mega", "giga"]

    value = (color_values.index(colors[0]) * 10 + color_values.index(colors[1]) ) * (10 ** color_values.index(colors[2]))
    order = 0
    while value > 1000:
        order += 1
        value //= 1000

    return f"{value} {prefixes[order]}ohms"
