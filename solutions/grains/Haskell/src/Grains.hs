module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n <= 0 || n > 64 = Nothing
  | otherwise = Just (2 ^ (n - 1))

total :: Integer
total = sum [2 ^ (n - 1) | n <- [1..64]]