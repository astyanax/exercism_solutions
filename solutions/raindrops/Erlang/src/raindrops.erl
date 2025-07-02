-module(raindrops).
-export([convert/1]).

convert(Number) ->
    Factors = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}],
    Result = lists:foldl(
        fun({Factor, Sound}, Acc) ->
            case Number rem Factor of
                0 -> Acc ++ Sound;
                _ -> Acc
            end
        end,
        "",
        Factors
    ),
    case Result of
        "" -> integer_to_list(Number);
        _ -> Result
    end.
