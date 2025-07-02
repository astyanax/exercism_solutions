module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode string = encodeRec '0' 0 (String.toList string)


encodeRec : Char -> Int -> List Char -> String
encodeRec lastCharacter count characters =
    case characters of
        [] -> stringify lastCharacter count
        currentCharacter :: rest ->
            if currentCharacter /= lastCharacter
            then stringify lastCharacter count ++ encodeRec currentCharacter 1 rest
            else encodeRec lastCharacter (count + 1) rest


stringify : Char -> Int -> String
stringify character count =
    case count of
        0 -> ""
        1 -> String.fromChar character
        _ -> String.fromInt count ++ String.fromChar character


decode : String -> String
decode string = decodeRec 0 (String.toList string)


decodeRec : Int -> List Char -> String
decodeRec count characters =
    case characters of
        [] -> ""
        currentCharacter :: rest ->
            if Char.isDigit currentCharacter
            then decodeRec (count * 10 + Char.toCode currentCharacter - Char.toCode '0') rest
            else String.repeat (max count 1) (String.fromChar currentCharacter) ++ decodeRec 0 rest
