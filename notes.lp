#const n = 2.
#const voices = 4.
#const key = 0.

% this rule dissalowws compositional errors
:- error(R,T), reason(R),T=-1..n.

% here is everything that is literally possible.
pitch(0..127).

% voice 1 is bass, 2 is above bass, 3 is above 2, etc.
voice(1..voices).


% Generate
voices{note(X,V,I) : pitch(X), voice(V) }voices :- I=0..n.


% tools
% inScale(X) :- pitch(X), X \ 12 == key.
% inScale(X) :- pitch(X), X \ 12 == key+2.
% inScale(X) :- pitch(X), X \ 12 == key+4.
% inScale(X) :- pitch(X), X \ 12 == key+5.
% inScale(X) :- pitch(X), X \ 12 == key+7.
% inScale(X) :- pitch(X), X \ 12 == key+9.
% inScale(X) :- pitch(X), X \ 12 == key+11.


consonant(X,Y) :- pitch(X), pitch(Y), X==Y.		
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+3.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+4.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+7.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+8.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+9.



consonant(X,Y) :- pitch(X), pitch(Y), pitch(Z), X == Z+12 , consonant(Z, Y).
consonant(X,Y) :- consonant(Y,X).




% error reasons
reason(e_polyphonic_single_voice).
reason(e_out_of_keyboard_range).
reason(e_voice_crossing).
reason(e_too_far_appart).
% reason(e_not_in_scale).
reason(e_not_consonant).


% error rules
error(e_polyphonic_single_voice,I) :- note(A,V,I), note(B,V,I), A!=B, I=0..n.
error(e_out_of_keyboard_range,I) :- note(A,V,I), A<60, I = 0..n .
error(e_out_of_keyboard_range,I) :- note(A,V,I), A>96, I = 0..n .
error(e_voice_crossing,I):- note(A,V,I), note(B,V+1,I), A>B, I = 0..n , V=0..voices.
error(e_too_far_appart,I):- note(A,V,I), note(B,V+1,I), A+12 < B, I = 0..n , V=0..voices.
error(e_not_consonant,I) :-
	note(A,V1,I),
	note(B,V2,I),
	V1 < V2,
	not consonant(A,B),
	I = 0..n,
	V1=0..voices,
	V2=0..voices.


#show note/3.








