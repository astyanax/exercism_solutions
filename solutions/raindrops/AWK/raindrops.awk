BEGIN {
  result = ""
  if (num % 3 == 0) {
    result = "Pling"
  }
  if (num % 5 == 0) {
    result = result "Plang"
  }
  if (num % 7 == 0) {
    result = result "Plong"
  }
  if (result == "") {
    result = num
  }
  print result
}
