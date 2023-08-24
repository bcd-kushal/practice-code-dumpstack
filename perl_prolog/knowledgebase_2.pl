%knowledgebase_2.pl
%Write a program in prolog to design a database which contains following data:
%i) Father(amlan,sanjay)
%ii)Father(sanjay,himadri)
%iii)Father(amlan,sneha)
%iv)Son(sanjay,amlan)
%v)Son(himadri,sanjay)
%vi)Daughter(sneha,amlan)
%vii)Grandfather(amlan,himadri)
%Set query to find who is father, son, daughter, grandfather.

father(amlan, sanjay).
father(sanjay,himadri).
father(amlan, sneha).
son(sanjay,amlan).
son(himadri,sanjay).
daughter(sneha,amlan).
grandfather(amlan,himadri).

query(A,B):- father(A,B), write(A), write(' is the father of '), write(B).
query(A,C):- father(A,B), father(B,C), write(A), write(' is the grandfather of '), write(C).
query(A,B):- son(A,B), write(A), write(' is the son of '), write(B).
query(A,B):- daughter(A,B), write(A), write(' is the daughter of '), write(B).





