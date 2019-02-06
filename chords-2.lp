#const voices = 2.
#const n = 7.
#const key = 0.

note(84,1,0).
note(88,2,0).

finishExists(I) :-
	note(84,1,I),
	note(88,2,I).



reason(e_not_finishing_right).
reason(e_not_in_scale).
reason(e_not_on_string).
reason(e_voice_crossing).



error(e_voice_crossing,I):- note(A,V,I), note(B,V+1,I), A>B.

error(e_not_on_string,I):-
	note(A,V,I),
	A < 83,
	V == 1.

error(e_not_on_string,I):-
	note(A,V,I),
	A > 87,
	V == 1.

error(e_not_on_string,I):-
	note(A,V,I),
	A < 88,
	V == 2.

error(e_not_on_string,I):-
	note(A,V,I),
	A > 92,
	V == 2.



error(e_not_finishing_right,n):-
	not finishExists(n).

error(e_not_in_scale,I):-
	note(A,V,I),
	not inScale(A).



#show finishExists/1.