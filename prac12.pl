queens(N, Queens) :-
    length(Queens, N),
    board(Queens, N),
    safe(Queens).

board([], _).
board([H|T], N) :-
    board(T, N),
    between(1, N, H).

safe([]).
safe([Q|Qs]) :-
    safe(Qs),
    \+ attack(Q, Qs, 1).

attack(X, [Y|_], N) :- X = Y.
attack(X, [Y|_], N) :- X is Y + N.
attack(X, [Y|_], N) :- X is Y - N.
attack(X, [_|Ys], N) :- N1 is N + 1, attack(X, Ys, N1).