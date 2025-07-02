class Raindrops {
  static convert(n) {
    var out = ""
    if (n % 3 == 0) out = out + "Pling"
    if (n % 5 == 0) out = out + "Plang"
    if (n % 7 == 0) out = out + "Plong"

    return out.isEmpty ? n.toString : out
  }
}
