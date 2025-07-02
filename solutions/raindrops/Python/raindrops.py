def convert(number):
    s = ""

    fizzbuzz = dict({3: 'Pling', 5: 'Plang', 7: "Plong"})

    for n in fizzbuzz:
        if number % n == 0:
            s += fizzbuzz[n]
    if s == "":
        s = str(number)
    return s