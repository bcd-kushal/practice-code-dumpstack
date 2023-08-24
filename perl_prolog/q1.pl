questionone:-
write('number 1: '), read(A),
write('number 2: '), read(B),
write('sum is: '),
SUM is A+B,
write(SUM),nl,
(
A>=B->(
	DIFF is A+(-1*B)
);
DIFF is B+(-1*A)),
write('diff is: '),
write(DIFF),nl,
PROD is A*B,
write('product is: '),
write(PROD),nl,
(
not(B=0)->(
	write('hi')
);
DIV is 'Division by 0',
REM is 'No Remainder',
write('nope')
).