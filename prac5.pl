% Facts: score(Student, Marks).
score(alice, 95).
score(bob, 65).
score(charlie, 30).

% Rules for classification
classify(Student, topper) :- score(Student, M), M >= 85.
classify(Student, average) :- score(Student, M), M >= 40, M < 85.
classify(Student, fail) :- score(Student, M), M < 40.
