
% this rule dissalowws compositional errors
:- error(R,T), reason(R),T=-1..n.


% here is everything that is literally possible.
pitch(55..96).

interval(0..41).

% voice 1 is bass, 2 is above bass, 3 is above 2, etc.
voice(1..voices).


% Generate
voices{note(X,V,I) : pitch(X), voice(V) }voices :- I=0..n.


% tools
inScale(X) :- pitch(X), X \ 12 == key.
inScale(X) :- pitch(X), X \ 12 == key+2.
inScale(X) :- pitch(X), X \ 12 == key+4.
inScale(X) :- pitch(X), X \ 12 == key+5.
inScale(X) :- pitch(X), X \ 12 == key+7.
inScale(X) :- pitch(X), X \ 12 == key+9.
inScale(X) :- pitch(X), X \ 12 == key+11.

% harmonic consonant: intervals, at any octave displacement, in any order
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y).		
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y+3).
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y+4).
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y+7).
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y+8).
consonant(X,Y) :- pitch(X), pitch(Y), X ==(Y+9).
consonant(X,Y) :- pitch(X), pitch(Y), pitch(Z), X == Z+12, Z >= Y , consonant(Z, Y).
consonant(X,Y) :- consonant(Y,X).

% melodic consonant: step or leap except tritone, 7ths, and <= 1 octave.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+1.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+2.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+3.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+4.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+5.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+7.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+8.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+9.
melodic(X,Y) :- pitch(X), pitch(Y), X==Y+12.
melodic(X,Y) :- melodic(Y,X).

isInterval(A,B,X) :- pitch(A), pitch(B), interval(X), (A + X) \ 12 == B \ 12.

isStep(A,B) :- pitch(A), pitch(B), A < B+3, A+3 > B, not A == B.



quality(maj).
quality(min).
quality(aug).
quality(dim).

isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==maj, R \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==min, R \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==aug, R \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==dim, R \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==min, R +3 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==dim, R +3 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==maj, R +4 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==aug, R +4 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==dim, R +6 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==min, R +7 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==maj, R +7 \ 12 == N \ 12.
isMemberOfTriad(N,R,Q) :- pitch(N), pitch(R), Q==aug, R +8 \ 12 == N \ 12.






% most general errors reasons
reason(e_polyphonic_single_voice).
reason(e_zero_voice).


% most general error rules
error(e_polyphonic_single_voice,I) :- note(A,V,I), note(B,V,I), A!=B, I=0..n.
error(e_zero_voice,I) :- note(A,V,I), V == 0.






#show note/3.








