% 1. Length
list_length([], 0).
list_length([_|T], L) :- list_length(T, L1), L is L1 + 1.

% 2. Member
list_member(X, [X|_]).
list_member(X, [_|T]) :- list_member(X, T).

% 3. Append
list_append([], L, L).
list_append([H|T], L, [H|R]) :- list_append(T, L, R).

% 4. Reverse
list_reverse([], []).
list_reverse([H|T], R) :- list_reverse(T, RevT), list_append(RevT, [H], R).