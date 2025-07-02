is_letter(C) :- char_type(C, alpha).
isogram(Phrase) :-
  string_lower(Phrase, PhraseLst),
  string_chars(PhraseLst, C),
  include(is_letter, C, Res),
  is_set(Res).