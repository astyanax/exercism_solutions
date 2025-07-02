can_chain([]).
can_chain([(X,X)]).

can_chain(List) :-
    select((X,Y), List, RestLink),
    (
        select((Link,Y), RestLink, Rest) ;
        select((Y,Link), RestLink, Rest)
    ),
    can_chain([(X,Link)|Rest]).