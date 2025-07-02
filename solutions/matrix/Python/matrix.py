class Matrix():
    __rows :list = []
    __columns :list = []

    def __init__(self, matrix_string):
        self.__rows = [[int(item) for item in row.split(' ')] for row in matrix_string.split('\n')]
        self.__columns = [list(column) for column in zip(*self.__rows)]

    def row(self, index=1):
        return self.__rows[index-1]


    def column(self, index=1):
        return self.__columns[index-1]