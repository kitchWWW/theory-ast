change(V,I) :-
	note(A,V,I),
	note(B,V,I+1),
	A != B.

change(I) :-
	voice(V),
	change(V,I).


reason(e_too_much_change).
reason(e_too_little_change).
reason(e_change_same_voice).



error(e_too_much_change,I):-
	change(V1,I),
	change(V2,I),
	V1 != V2,
	I = 0..n.

error(e_too_little_change,I):-
	not change(I),
	I = 0..n-1.

error(e_change_same_voice,I):-
	change(V,I),
	change(V,I+1),
	I = 0..n.

#show change/2.