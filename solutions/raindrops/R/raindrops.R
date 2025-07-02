raindrops <- function(num) {
  res <- ""
  if (num %% 3 == 0) {
    res <- paste(res, "Pling", sep = "")
  }
  if (num %% 5 == 0) {
    res <- paste(res, "Plang", sep = "")
  }
  if (num %% 7 == 0) {
    res <- paste(res, "Plong", sep = "")
  }
  if (nchar(res) == 0) {
    res <- as.character(num)
  }
  res
}