% Graph edges
edge(a, b). edge(a, c). edge(b, d). edge(c, d). edge(d, e).

% Undirected graph wrapper
connected(X, Y) :- edge(X, Y) ; edge(Y, X).

bfs(Start, Goal, Path) :- bfs_queue([[Start]], Goal, RevPath), reverse(RevPath, Path).

bfs_queue([[Goal|Path]|_], Goal, [Goal|Path]).
bfs_queue([[Node|Path]|Rest], Goal, FinalPath) :-
    findall([NextNode, Node|Path],
            (connected(Node, NextNode), \+ member(NextNode, [Node|Path])),
            NewPaths),
    append(Rest, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, FinalPath).