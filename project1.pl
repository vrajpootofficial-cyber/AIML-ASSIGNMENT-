% Facts: studies(Student, Course).
studies(alice, ai).
studies(bob, dbms).
studies(charlie, ai).
studies(david, os).

% Facts: teaches(Professor, Course).
teaches(dr_smith, ai).
teaches(dr_jones, dbms).

% Rule: Who is a student of which professor?
student_of(Student, Professor) :- 
    studies(Student, Course), 
    teaches(Professor, Course).