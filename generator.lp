#const n = 8.
#const voices = 2.
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

% harmonic consonant: intervals, at any octave displacement, in any order
consonant(X,Y) :- pitch(X), pitch(Y), X==Y.		
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+3.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+4.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+7.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+8.
consonant(X,Y) :- pitch(X), pitch(Y), X==Y+9.
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





#show note/3.








