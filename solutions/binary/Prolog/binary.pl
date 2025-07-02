binary_convert([], 0).
binary_convert([H|L], Dec) :-
    atom_number(H, Hn), between(0, 1, Hn), binary_convert(L, Rest), Dec is Hn + 2 * Rest.

binary(Str, Dec) :-
    string_chars(Str, CList),
    reverse(CList, RCList),
    binary_convert(RCList, Dec).
