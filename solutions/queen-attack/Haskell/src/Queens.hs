module Queens (boardString, canAttack) where

type Pos = (Int, Int)

boardString :: Maybe Pos -> Maybe Pos -> String
boardString white black = unlines (map row [0..7])
  where row r = unwords (map (cell r) [0..7])
        cell r c
          | white == Just (r, c) = "W"
          | black == Just (r, c) = "B"
          | otherwise = "_"

canAttack :: Pos -> Pos -> Bool
canAttack (wr, _) (br, _) | wr == br = True
canAttack (_, wc) (_, bc) | wc == bc = True
canAttack (wr, wc) (br, bc) = rowDiff == colDiff
  where rowDiff = abs (wr - br)
        colDiff = abs (wc - bc)