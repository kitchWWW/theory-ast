#const voices = 2.

% general error reasons
reason(e_out_of_keyboard_range).
reason(e_voice_crossing).
reason(e_too_far_appart).
reason(e_not_in_scale).
reason(e_not_consonant).
reason(e_not_melodic).

% general error rules
error(e_out_of_keyboard_range,I) :- note(A,V,I), A<60, I = 0..n .
error(e_out_of_keyboard_range,I) :- note(A,V,I), A>96, I = 0..n .
error(e_voice_crossing,I):- note(A,V,I), note(B,V+1,I), A>B, I = 0..n , V=0..voices.
error(e_too_far_appart,I):- note(A,V,I), note(B,V+1,I), A+12 < B, I = 0..n , V=0..voices.
error(e_not_in_scale,I) :- note(A,V,I), not inScale(A), I = 0..n , V=0..voices.
error(e_not_consonant,I) :-
	note(A,V1,I),
	note(B,V2,I),
	V1 < V2,
	not consonant(A,B),
	I = 0..n,
	V1=0..voices,
	V2=0..voices.
error(e_not_melodic,I) :-
	note(A,V,I),
	note(B,V,I+1),
	not melodic(A,B),
	I = 0..n,
	V = 0..voices.



