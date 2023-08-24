%knowledgebase_3.pl
% Write a program in prolog to design a knowledgebase to store teacher_code and subjects taught by them.
% Teacher_code:
% ab, subject = c, c++, php, prolog, python.
% sm, subject = html, php, c, ai, prolog.
% ds, subject = c, java, matlab, python.
% sk, subject = prolog, ai, fsm, php, python.

%Design a query to find teacher-code who can take class of i) c ii) c++ iii) java iv) prolog v) python vi) html vii) php viii)ai ix)matlab x)fsm

teach(ab,c).
teach(ab,cpp).
teach(ab,php).
teach(ab,prolog).
teach(ab,python).
teach(sm,html).
teach(sm,php).
teach(sm,c).
teach(sm,ai).
teach(sm,prolog).
teach(ds,c).
teach(ds,java).
teach(ds,matlab).
teach(ds,python).
teach(sk,prolog).
teach(sk,ai).
teach(sk,fsm).
teach(sk,php).
teach(sk,python).

query(Teacher, Subject):- teach(Teacher, Subject), write(Teacher), write(' teaches '), write(Subject), nl.
