-module(all_your_base).

-export([rebase/3, to_list/2]).

rebase(_Digits, _InputBase, _OutputBase) when _InputBase < 2 -> {error, "input base must be >= 2"};
rebase(_Digits, _InputBase, _OutputBase) when _OutputBase < 2 -> {error, "output base must be >= 2"};
rebase(_Digits, _InputBase, _OutputBase) -> 
    case lists:all(fun(D) -> D >= 0 andalso D < _InputBase end, _Digits) of
        false -> {error, "all digits must satisfy 0 <= d < input base"};
        true -> {ok, to_list( lists:foldl(fun(X, _Acc) -> _Acc*_InputBase + X end, 0, _Digits), _OutputBase)}
    end.

to_list(_Integer, _Base) when _Integer < _Base -> [_Integer];
to_list(_Integer, _Base) -> to_list(_Integer div _Base, _Base)++[_Integer rem _Base].
