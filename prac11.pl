% Colors available
color(red). color(green). color(blue).

% Regions must have different colors if adjacent
color_map(WA, NT, SA, Q, NSW, V, T) :-
    color(WA), color(NT), color(SA), color(Q), color(NSW), color(V), color(T),
    WA \= NT, WA \= SA,
    NT \= SA, NT \= Q,
    SA \= Q, SA \= NSW, SA \= V,
    Q \= NSW,
    NSW \= V. % Tasmania (T) is not adjacent to any