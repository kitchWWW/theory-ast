
% first species reasons for errors
reason(e_parallel_fifths).
reason(e_parallel_octaves).
reason(e_repetative_notes).
reason(e_leap_after_leap).
reason(e_bad_step_leap).
reason(e_non_unison_end).
reason(e_non_triad_start).
reason(e_bad_start_stop).
reason(e_not_step_last_melodic).
reason(e_bad_last_harmonic).
reason(e_static_motion).
reason(e_both_leap).




error(e_static_motion,I) :-
	note(A,V1,I),
	note(B,V2,I),
	note(C,V1,I+1),
	note(D,V2,I+1),
	A == C,
	B == D,
	not V1 == V2,
	I = 0..n-1,
	V1 = 1..voices,
	V2 = 1..voices.

%% error(e_both_leap,I):-
%% 	note(A,V1,I),
%% 	note(B,V2,I),
%% 	note(C,V1,I+1),
%% 	note(D,V2,I+1),
%% 	not isStep(A,C),
%% 	not isStep(B,D),
%% 	not V1 == V2,
%% 	I = 0..n-1,
%% 	V1 = 1..voices,
%% 	V2 = 1..voices.


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
	V1 = 1..voices,
	V2 = 1..voices.

error(e_parallel_octaves,I) :-
	note(A,V1,I),
	note(B,V2,I),
	note(C,V1,I+1),
	note(D,V2,I+1),
	isInterval(A,B,0),
	isInterval(C,D,0),
	V1 < V2,
	I = 0..n-1,
	V1 = 1..voices,
	V2 = 1..voices.

error(e_repetative_notes,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	A == B,
	B == C,
	I = 0..n-2,
	V = 1..voices.

error(e_leap_after_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	not isStep(B,C),
	I = 0..n-2,
	V = 1..voices. % skip voice 1 because bass is allowed to jump

error(e_bad_step_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	A > B,
	B >= C,
	I = 0..n-2,
	V = 1..voices.
error(e_bad_step_leap,I) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V,I+2),
	not isStep(A,B),
	A < B,
	B <= C,
	I = 0..n-2,
	V = 1..voices.

error(e_non_unison_end,n) :-
	note(A,V1,n),
	note(B,V2,n),
	not isInterval(A,B,0),
	V1 = 1..voices,
	V2 = 1..voices.

error(e_bad_start_stop,n):-
	note(A,V,n),
	not isInterval(A,B,0),
	pitch(B),
	B \ 12 == key.

error(e_bad_start_stop,0):-
	note(A,V,0),
	not isInterval(A,B,0),
	pitch(B),
	B \ 12 == key.

error(e_not_step_last_melodic,n-1):-
	note(A,V,n-1),
	note(B,V,n),
	not isStep(A,B),
	V = voices.


error(e_non_triad_start,0):-
	note(A,1,0),
	note(B,2,0),
	not isMemberOfTriad(B,A,maj).








