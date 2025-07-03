convert(N, Sounds) :-
    ( N mod 3 =:= 0 -> string_concat("", "Pling", R3) ; string_concat("", "", R3) ),
    ( N mod 5 =:= 0 -> string_concat(R3, "Plang", R35) ; string_concat(R3, "", R35) ),
    ( N mod 7 =:= 0 -> string_concat(R35, "Plong", R357) ; string_concat(R35, "", R357) ),
    ( R357 == "" -> number_string(N, Sounds) ; Sounds = R357 ).