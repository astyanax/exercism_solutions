class ArmstrongNumber {

    static isArmstrongNumber(number) {
        def digits = number.toString().collect { it.toString().toInteger() }
        def power = digits.size()
        def sum = digits.sum { Math.pow(it, power) }
        return sum == number
    }

}
