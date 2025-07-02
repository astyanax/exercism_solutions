module FoodChain (song) where

end ::  String
end = "I know an old lady who swallowed a horse.\nShe's dead, of course!\n"

firstVerse :: [String]
firstVerse = map ("I know an old lady who swallowed a " ++)
             ["fly.\n",
             "spider.\nIt wriggled and jiggled and tickled inside her.\n",
             "bird.\nHow absurd to swallow a bird!\n",
             "cat.\nImagine that, to swallow a cat!\n",
             "dog.\nWhat a hog, to swallow a dog!\n",
             "goat.\nJust opened her throat and swallowed a goat!\n",
             "cow.\nI don't know how she swallowed a cow!\n"]

refrain :: [String]
refrain = ["I don't know why she swallowed the fly. Perhaps she'll die."] ++ 
          map ("She swallowed the " ++)
         ["spider to catch the fly.", 
         "bird to catch the spider that wriggled and jiggled and tickled inside her.",
         "cat to catch the bird.",
         "dog to catch the cat.",
         "goat to catch the dog.",
         "cow to catch the goat."]


f :: Int -> String
f x = (firstVerse !! x) ++ ((unlines . reverse . (take $ x + 1)) refrain)

song :: String
song = (unlines $ map f [0..6]) ++ end