def color_code(color):
    return color_mapping()[color]

def color_mapping():
    return dict(zip( ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"], range(10) ))

def colors():
    return ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
