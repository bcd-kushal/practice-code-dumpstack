prod(1,1).
prod(N,Res):-
	N>0,
	N1 is N-1,
	write(' * '),write(N1),
	prod(N1,Res1),
	Res is N*Res1.