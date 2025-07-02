module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divisibleBy4 && (not divisibleBy100 || divisibleBy400)
  where
    divisibleBy4 = year `mod` 4 == 0
    divisibleBy100 = year `mod` 100 == 0
    divisibleBy400 = year `mod` 400 == 0