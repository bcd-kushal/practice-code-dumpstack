%knowledgebase_1.pl:Write a program in prolog to store data of major metro stations in Kolkata.
%designing facts

stop(mahanayakuttamkumar, rabindrasarobar).
stop(rabindrasarobar, mahanayakuttamkumar).
stop(kalighat, rabindrasarobar).
stop(rabindrasarobar, kalighat).
stop(kalighat, jatindaspark).
stop(jatindaspark, kalighat).
stop(jatindaspark, netajibhawan).
stop(netajibhawan, jatindaspark).
stop(netajibhawan, rabindrasadan).
stop(rabindrasadan, netajibhawan).
stop(maidan, rabindrasadan).
stop(rabindrasadan, maidan).

%relations

connection(A,B):- 
stop(A,B), write(A), S is 1, write('-->'), write(B), write(', Distance = '), write(S), write(' km'), nl.

connection(A,C):- 
stop(A,B), stop(B,C), write(A), write('-->'), write(B), write('-->'), write(C),S is 2,write(', Distance = '), write(S), write(' km'), nl.

connection(A,D):- 
stop(A,B), stop(B,C), stop(C,D), S is 3, write(A), write('-->'), write(B), write('-->'), write(C), write('-->'), write(D),
write(', Distance = '), write(S), nl.

connection(A,E):- 
stop(A,B), stop(B,C), stop(C,D), stop(D,E), write(A), write('-->'), write(B), write('-->'), write(C), write('-->'), write(D), write('-->'), write(E),  nl.

connection(A,F):- 
stop(A,B), stop(B,C), stop(C,D), stop(D,E), stop(E,F), write(A), write('-->'), write(B), write('-->'), write(C), write('-->'), write(D), write('-->'), write(E) , write('-->'), write(F),  nl.

connection(A,G):- 
stop(A,B), stop(B,C), stop(C,D), stop(D,E), stop(E,F), stop(F,G), write(A), write('-->'), write(B), write('-->'), write(C), write('-->'), write(D), write('-->'), write(E) , write('-->'), write(F), write('-->'), write(G), nl.
