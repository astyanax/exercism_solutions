class Flatten {
  static flatten(list) {
    if (list is Num) return [list]
    if (list is Sequence) return list.map {|l| flatten(l) }.reduce([]) { |lst, e| lst + e }
    return []
  }
}