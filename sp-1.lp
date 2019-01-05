
% first species reasons for errors
reason(e_parallel_fifths).
reason(e_parallel_octaves).
reason(e_repetative_notes).
reason(e_leap_after_leap).
reason(e_bad_step_leap).
reason(e_non_unison_end).

% first species rules for errors
error(e_parallel_fifths,I) :-
	note(A,V1,I),
	note(B,V2,I),
	note(C,V1,I+1),
	note(D,V2,I+1),
	isInterval(A,B,7),
	isInterval(C,D,7),
	V1 < V2,
	I = 0..n-1,
	V1 = 0..voices,
	V2 = 0..voices.

error(e_parallel_octaves,I) :-
	note(A,V1,I),
	note(B,V2,I),
	note(C,V1,I+1),
	note(D,V2,I+1),
	isInterval(A,B,0),
	isInterval(C,D,0),
	V1 < V2,
	I = 0..n-1,
	V1 = 0..voices,
	V2 = 0..voices.

error(e_repetative_notes,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	A == B,
	B == C,
	I = 0..n-2,
	V = 0..voices.

error(e_leap_after_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	not isStep(B,C),
	I = 0..n-2,
	V = 2..voices. % skip voice 1 because bass is allowed to jump

error(e_bad_step_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	A > B,
	B >= C,
	I = 0..n-2,
	V = 2..voices.
error(e_bad_step_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	A < B,
	B <= C,
	I = 0..n-2,
	V = 2..voices.

error(e_non_unison_end,n) :-
	note(A,V1,n),
	note(B,V2,n),
	not isInterval(A,B,0),
	V1 = 0..voices,
	V2 = 0..voices.











