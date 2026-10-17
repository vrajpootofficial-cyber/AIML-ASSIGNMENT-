edge(s, a, 1). edge(s, b, 1). edge(a, g, 1). edge(b, g, 1).
h(s, 2). h(a, 1). h(b, 2). h(g, 0). % Heuristics to Goal G

greedy(Start, Goal, Path) :- greedy_q([[Start]], Goal, Rev), reverse(Rev, Path).

greedy_q([[Goal|Path]|_], Goal, [Goal|Path]).
greedy_q([[Node|Path]|Rest], Goal, FinalPath) :-
    findall([NextNode, Node|Path], (edge(Node, NextNode, _), \+ member(NextNode, [Node|Path])), Children),
    append(Rest, Children, AllPaths),
    sort_paths_by_h(AllPaths, SortedPaths),
    greedy_q(SortedPaths, Goal, FinalPath).

sort_paths_by_h(Paths, Sorted) :-
    predsort(cmp_h, Paths, Sorted).
cmp_h(Order, [N1|_], [N2|_]) :- h(N1, H1), h(N2, H2), compare(Order, H1, H2).