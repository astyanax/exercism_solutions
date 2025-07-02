difference_of_squares <- function(natural_number) {
  sum_of_squares <- sum(seq_len(natural_number)^2)
  square_of_sum <- sum(seq_len(natural_number))^2
  square_of_sum - sum_of_squares
}