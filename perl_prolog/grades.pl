grades:-
ERR is 'enter marks between 0-100.',
write('ppr 1: '),read(A),
A>=0,A<=100->(
write('ppr 2: '),read(B),
B>=0,B<=100->(
write('ppr 3: '),read(C),
C>=0,C<=100->(
TOTAL is A+B+C,
AVG is TOTAL/3,
GRADE is 'Grade: Fail.',
AVG>=40->(
AVG>=50->(
AVG>=60->(
GRADE is 'Grade: 1st division.',
write(GRADE)
);
GRADE is 'Grade: 2nd division.',
write(GRADE)
);
GRADE is 'Grade: 3rd division.',
write(GRADE)
);
write(GRADE)
);
write(ERR)
);
write(ERR)
);
write(ERR).