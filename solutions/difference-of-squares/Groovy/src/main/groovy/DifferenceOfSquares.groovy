class DifferenceOfSquares {
    private int number

    DifferenceOfSquares(num) {
        this.number = num
    }

    def squareOfSum() {
        def sum = (1..number).sum()
        return sum * sum
    }

    def sumOfSquares() {
        return (1..number).collect { it * it }.sum()
    }

    def difference() {
        return squareOfSum() - sumOfSquares()
    }
}