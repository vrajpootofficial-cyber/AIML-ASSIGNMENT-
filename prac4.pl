% schedule(Faculty, Subject, Room, Day, Time)
schedule(dr_smith, ai, room101, monday, '10:00 AM').
schedule(dr_jones, dbms, room102, monday, '11:00 AM').
schedule(dr_smith, ai, room101, wednesday, '10:00 AM').

% Query Rule
where_is(Faculty, Day, Room, Time) :- 
    schedule(Faculty, _, Room, Day, Time).
    