triangle(A, B, C, Type) :-
	A + B > C,
	B + C > A,
	C + A > B,
	triangle_(A, B, C, Type).

triangle_(A, A, A, "equilateral") :- !.
triangle_(A, B, C, "isosceles") :- (A =:= B; B =:= C; C =:= A), !.
triangle_(A, B, C, "scalene") :- A =\= B, B =\= C, C =\= A, !.