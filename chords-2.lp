#const voices = 2.
#const n = 5.
#const key = 0.

note(84,1,0).
note(88,2,0).

finishExists(I) :-
	note(84,1,I),
	note(88,2,I).



third(A,B) :- pitch(A), pitch(B), A = B+3.
third(A,B) :- pitch(A), pitch(B), A = B+4.
third(A,B) :- pitch(A), pitch(B), A+3 = B.
third(A,B) :- pitch(A), pitch(B), A+4 = B.


reason(e_not_finishing_right).
reason(e_not_in_scale).
reason(e_not_on_string).
reason(e_voice_crossing).



error(e_voice_crossing,I):- note(A,V,I), note(B,V+1,I), A>B, I = 0..n , V=1..voices.

error(e_not_on_string,n):-
	note(A,V,I),
	A < 83,
	I = 0..n.

error(e_not_on_string,n):-
	note(A,V,I),
	A > 92,
	I = 0..n.


error(e_not_finishing_right,n):-
	not finishExists(n).

error(e_not_in_scale,I):-
	note(A,V,I),
	not inScale(A),
	I = 0..n,
	V = 1..voices.



#show finishExists/1.