def resistor_label(colors: list[str]) -> str:
    colorValues = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    units = ["ohms", "kiloohms", "megaohms", "gigaohms"]
    tolerances = {"grey": "0.05%", "violet": "0.1%", "blue": "0.25%", "green": "0.5%", "brown": "1%", "red": "2%", "gold": "5%", "silver": "10%"}

    if len(colors) > 3:
        *resistances, multiplier, toleranceColour = colors
    else:
        resistances, multiplier, toleranceColour = colors, colorValues[0], ""

    resistanceValue = 0
    for value in resistances:
        resistanceValue = resistanceValue * 10 + colorValues.index(value)
    resistanceValue *= 10 ** colorValues.index(multiplier)  
    
    order = 0
    while resistanceValue > 1000:
        order += 1
        resistanceValue /= 1000

    unit = f" {units[order]}"

    suffix = ""
    if toleranceColour != "":
        suffix = f" ±{tolerances[toleranceColour]}"

    return f"{resistanceValue:n}{unit}{suffix}"
