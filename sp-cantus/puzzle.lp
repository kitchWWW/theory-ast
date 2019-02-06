#const n = 14.
#const key = 0.


reason(e_not_puzzle_cannon).

error(e_not_puzzle_cannon,I) :-
	note(A,V1,I),
	note(B,V1+1,n-I),
	not isInterval(A,B,0),
	I = 0..n.