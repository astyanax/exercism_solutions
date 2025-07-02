raindrops <- function(num) {
  factors <- c("Pling" = 3, "Plang" = 5, "Plong" = 7)
  result <- factors[num %% factors == 0] |> names() |> paste(collapse = "")
  ifelse(nchar(result) > 1, yes = result, no = as.character(num))
}