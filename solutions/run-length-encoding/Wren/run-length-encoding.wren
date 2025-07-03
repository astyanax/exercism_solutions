class RLE {
  static encode(s) {
    var prev = ""
    return s
      .reduce([]) {|runs, c|
        if (prev != c) {
          prev = c
          runs.add([c, 1])
        } else {
          runs[-1] = [runs[-1][0], runs[-1][1] + 1]
        }
        return runs
      }
      .map {|run| run[1] == 1 ? [run[0], ""] : run}
      .map {|run| "%(run[1])%(run[0])"}
      .join()
  }

  static decode(s) {
    var count = 0
    return s
      .reduce([]) {|pieces, c|
        if (isInteger(c)) {
          count = count * 10 + Num.fromString(c)
        } else {
          pieces.add(c * count.max(1))
          count = 0
        }
        return pieces
      }
      .join()
  }

  static isInteger(c) { "0123456789".contains(c) }
}