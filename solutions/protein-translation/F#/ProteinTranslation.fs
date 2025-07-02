module ProteinTranslation

let codonToProtein = function
    | "AUG" -> Some "Methionine"
    | "UUU" | "UUC" -> Some "Phenylalanine"
    | "UUA" | "UUG" -> Some "Leucine"
    | "UCU" | "UCC" | "UCA" | "UCG" -> Some "Serine"
    | "UAU" | "UAC" -> Some "Tyrosine"
    | "UGU" | "UGC" -> Some "Cysteine"
    | "UGG" -> Some "Tryptophan"
    | "UAA" | "UAG" | "UGA" -> Some "STOP"
    | _ -> None

let proteins rna =
    rna
    |> Seq.chunkBySize 3
    |> Seq.map (System.String >> codonToProtein)
    |> Seq.takeWhile ((<>) (Some "STOP"))
    |> Seq.choose id // Filter out None options and unwrap the Some values (return inner value)
    |> Seq.toList
