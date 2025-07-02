def label(colors):
    def _colorVal(idx):
        color_values = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
        return color_values.index(idx)

    def _convert(value):
        prefixes = ["", "kilo", "mega", "giga"]
        order = 0
        while value > 1000:
            order += 1
            value //= 1000
        
        return (value, prefixes[order])
    
    value = ( _colorVal(colors[0]) * 10 + _colorVal(colors[1]) ) * (10 ** _colorVal(colors[2]))
    result = _convert(value)

    return f"{result[0]} {result[1]}ohms"
