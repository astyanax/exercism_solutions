first_letter(W, C) :- 
  string_chars(W, [C|_]).

abbreviate(Sentence, Acronym):-
    string_upper(Sentence, UpperSentence),
    split_string(UpperSentence, "-_ ", "-_ ", Tokens),
    maplist(first_letter, Tokens,  Letters),
    atomics_to_string(Letters, Acronym).