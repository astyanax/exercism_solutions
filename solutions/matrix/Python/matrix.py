class Matrix():
    __rows: list = []
    __columns: list = []

    def __init__(self, matrix_string: str) -> list:
        self.__rows = [[int(item) for item in row.split(' ')] for row in matrix_string.split('\n')]
        self.__columns = [list(column) for column in zip(*self.__rows)]

    def row(self, index=1):
        if 1 <= index <= len(self.__rows):
            return self.__rows[index-1]
        else:
            raise ValueError(f"row number should be between 1 and {len(self.__rows)}")

    def column(self, index=1):
        if 1 <= index <= len(self.__columns):
            return self.__columns[index-1]
        else:
            raise ValueError(f"column number should be between 1 and {len(self.__columns)}")