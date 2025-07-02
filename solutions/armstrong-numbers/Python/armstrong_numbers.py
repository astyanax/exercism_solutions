def is_armstrong_number(number):
    return number == sum([int(ch)**len(str(number)) for ch in str(number)])