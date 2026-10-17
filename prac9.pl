% Simple 1D function optimization (finding local maximum)
value(0, 2). value(1, 5). value(2, 8). value(3, 4). 
neighbor(X, Y) :- Y is X + 1.
neighbor(X, Y) :- Y is X - 1.

hill_climb(Current, MaxNode) :-
    value(Current, Val),
    findall(N, neighbor(Current, N), Neighbors),
    best_neighbor(Neighbors, BestN, BestVal),
    (BestVal > Val -> hill_climb(BestN, MaxNode) ; MaxNode = Current).

best_neighbor([], none, -9999).
best_neighbor([H|T], BestN, BestVal) :-
    (value(H, V) -> true ; V = -9999),
    best_neighbor(T, N1, V1),
    (V > V1 -> (BestN = H, BestVal = V) ; (BestN = N1, BestVal = V1)).