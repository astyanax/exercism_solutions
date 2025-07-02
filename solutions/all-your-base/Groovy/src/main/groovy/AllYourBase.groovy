class AllYourBase {

    def inBase10 = 0
    AllYourBase(inputBase, digits) {
        if (inputBase < 2) throw new ArithmeticException()
        digits.each {
            if (it < 0 || it >= inputBase) throw new ArithmeticException()
            inBase10 = inBase10 * inputBase + it
        }
    }
    def rebase(outputBase) {
        if (outputBase < 2) throw new ArithmeticException()
        def converted = []
        while (inBase10) {
            converted << inBase10 % outputBase
            inBase10 = inBase10.intdiv(outputBase)
        }
        converted.reverse() ?: [0]
    }

}
