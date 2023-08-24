extract(0,0).
extract(1,1).
extract(2,2).
extract(3,3).
extract(4,4).
extract(5,5).
extract(6,6).
extract(7,7).
extract(8,8).
extract(9,9).
extract(N,Result):-
	N>0,
	
	N1 is N//10,
	DIG is N mod 10,
	nl,write(DIG),
	N>9->extract(N1,Result1),
	Result is 0+Result1.