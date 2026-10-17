% Reusing edge/3 and h/2 from Practical 7
astar(Start, Goal, Path) :- astar_q([[0, Start]], Goal, Rev), reverse(Rev, Path_w_cost), extract_path(Path_w_cost, Path).

astar_q([[_, Goal|Path]|_], Goal, [Goal|Path]).
astar_q([[GCost, Node|Path]|Rest], Goal, FinalPath) :-
    findall([NewCost, NextNode, Node|Path], 
            (edge(Node, NextNode, StepCost), \+ member(NextNode, [Node|Path]), NewCost is GCost + StepCost), 
            Children),
    append(Rest, Children, AllPaths),
    sort_paths_by_f(AllPaths, SortedPaths),
    astar_q(SortedPaths, Goal, FinalPath).

sort_paths_by_f(Paths, Sorted) :- predsort(cmp_f, Paths, Sorted).
cmp_f(Order, [G1, N1|_], [G2, N2|_]) :- h(N1, H1), h(N2, H2), F1 is G1+H1, F2 is G2+H2, compare(Order, F1, F2).
extract_path([_|T], T).