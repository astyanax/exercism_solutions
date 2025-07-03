% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% Replace the goal below with
% your implementation.

create( (X,Y) ) :-
    between(0,7,X),
    between(0,7,Y).

attack( (X1,Y1), (X2,Y2) ):-
    create( (X1,Y1) ),
    create( (X2,Y2) ),
    X1 = X2 ;
    Y1 = Y2 ;
    abs(Y2-Y1) =:= abs(X2-X1).
