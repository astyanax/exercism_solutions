triangle(A, B, C, Type) :-
	A + B > C,
	B + C > A,
	C + A > B,
	check_triangle_type(A, B, C, Type).

check_triangle_type(A, A, A, "equilateral") :- true.
check_triangle_type(A, B, C, "isosceles") :-
    A =:= B; B =:= C; C =:= A, !.
check_triangle_type(A, B, C, "scalene") :-
    A =\= B, B =\= C, C =\= A, !.