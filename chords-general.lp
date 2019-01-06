change(I,V) :-
	note(A,V,I),
	note(B,V,I+1),
	note(C,V1,I),
	note(C,V1,I+1),
	V1 != V,
	V1 = 0..voices.


reason(e_too_much_change).



#show change/2.