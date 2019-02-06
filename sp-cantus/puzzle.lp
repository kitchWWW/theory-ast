#const n = 9.
#const key = 0.


reason(e_not_puzzle_cannon).

error(e_not_puzzle_cannon,I) :-
	note(A,V1,I),
	note(B,V1+1,n-I),
	not A+24 == B,
	I = 0..n.