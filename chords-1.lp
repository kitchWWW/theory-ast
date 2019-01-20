#const voices = 3.
#const n = 15.
#const key = 0.

note(72,1,0).
note(76,2,0).
note(79,3,0).

finishExists(I) :-
	note(68,1,I),
	note(73,2,I),
	note(77,3,I).


triad(I):- note(A,1,I), note(B,2,I), note(C,3,I), pitch(D), pitch(E), pitch(F), D == (A \ 12), E == ((-D) + B) \ 12, F == ((-D) + C) \ 12,
	E == 3, F == 6..9.
triad(I):- note(A,1,I), note(B,2,I), note(C,3,I), pitch(D), pitch(E), pitch(F), D == (A \ 12), E == ((-D) + B) \ 12, F == ((-D) + C) \ 12,
	E == 4, F == 7..9.
triad(I):- note(A,1,I), note(B,2,I), note(C,3,I), pitch(D), pitch(E), pitch(F), D == (A \ 12), E == ((-D) + B) \ 12, F == ((-D) + C) \ 12,
	E == 5, F == 8..9.



third(A,B) :- pitch(A), pitch(B), A = B+3.
third(A,B) :- pitch(A), pitch(B), A = B+4.
third(A,B) :- pitch(A), pitch(B), A+3 = B.
third(A,B) :- pitch(A), pitch(B), A+4 = B.


reason(e_not_required_harmonic_interval).
reason(e_not_required_melodic_interval).
reason(e_not_finishing_right).


error(e_not_required_harmonic_interval,I):-
	not triad(I),
	I = 0 ..n.


error(e_not_required_melodic_interval,I):-
	note(A,V,I),
	note(B,V,I+1),
	not isStep(A,B),
	I = 0..n,
	V = 1..voices.


error(e_not_finishing_right,n):-
	not finishExists(n).

#show finishExists/1.