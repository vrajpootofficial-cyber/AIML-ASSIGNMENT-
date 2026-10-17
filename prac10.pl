% Using value/2 and neighbor/2 from Hill climbing.
sim_anneal(Current, Temp, FinalNode) :-
    Temp < 0.1, FinalNode = Current, !. % Stop condition
sim_anneal(Current, Temp, FinalNode) :-
    value(Current, CurrentVal),
    neighbor(Current, Next), value(Next, NextVal) -> true ; NextVal = -9999,
    Delta is NextVal - CurrentVal,
    (Delta > 0 -> NextState = Next 
    ; (Prob is exp(Delta/Temp), random(0.0, 1.0, R), R < Prob -> NextState = Next ; NextState = Current)),
    NewTemp is Temp * 0.9,
    sim_anneal(NextState, NewTemp, FinalNode).