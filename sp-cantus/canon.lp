#const n = 15.
#const key = 0.


reason(e_not_cannon).

error(e_not_cannon,I) :-
	note(A,V1,I),
	note(B,V1+1,I+5),
	not A+24 == B,
	I = 0..n-5.