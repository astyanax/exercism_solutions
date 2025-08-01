def square_of_sum(number):
    return number**2 * (number+1)**2 // 4


def sum_of_squares(number):
    return sum(x**2 for x in range(1, number+1))


def difference_of_squares(number):
    return square_of_sum(number) - sum_of_squares(number)
