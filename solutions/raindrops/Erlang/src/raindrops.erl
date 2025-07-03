-module(raindrops).
-export([convert/1]).

convert(Number) ->
Result = lists:concat([if Number rem 3 == 0 -> "Pling" ; true -> ""  end,
                       if Number rem 5 == 0 -> "Plang" ; true -> "" end,
                       if Number rem 7 == 0 -> "Plong" ; true -> ""  end
                       ]),
if Result == "" -> integer_to_list(Number);
    true -> Result
end.
