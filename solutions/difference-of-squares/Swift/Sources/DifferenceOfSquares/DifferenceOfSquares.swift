class Squares {
    let number: Int

    init(_ number: Int) {
        self.number = number
    }

    var squareOfSum: Int {
        let sum = (1...number).reduce(0, +)
        return sum * sum
    }

    var sumOfSquares: Int {
        return (1...number).reduce(0) { $0 + ($1 * $1) }
    }

    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
