sum(1,1).
sum(N,Result):-
	N>0,
	N1 is N-1,
	sum(N1,Result1),
	Result is Result1+(N*N).
