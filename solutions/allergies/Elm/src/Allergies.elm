module Allergies exposing (Allergy(..), isAllergicTo, toList)
import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


allergies: List (Allergy, Int)
allergies = [(Eggs,1), (Peanuts,2), (Shellfish, 4), (Strawberries,8), 
             (Tomatoes, 16), (Chocolate, 32), (Pollen, 64), (Cats, 128)]
isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    List.foldl (\(a, n) result -> ((a==allergy)&&((Bitwise.and n score)/=0))||result) False allergies


toList : Int -> List Allergy
toList score =
    allergies |> List.filter (\(a,_)->isAllergicTo a score) |> List.map Tuple.first

