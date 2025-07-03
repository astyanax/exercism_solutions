class Leap {

    private Integer year

    Leap(Integer year) {
        this.year = year
    }

    def isLeapYear() {
        // A leap year is divisible by 4
        // But if also divisible by 100, it must be divisible by 400 to be a leap year
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    }

}