class Diamond {
  static rows(letter) {
    var n = letter.bytes[0] - 65
    var l = (0..n).map { |x| " " * (n - x) + String.fromByte(x + 65) + " " * x }
                  .map { |x| x + x[-1..0].skip(1).join() }.toList
    return l + l[-1..0].skip(1).toList
  }
}