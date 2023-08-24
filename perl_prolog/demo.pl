printDigits(N):-
    N>0,
    N1 is N-1,
    write(N),write('  '),
    printDigits(N1).

lowercase(Str, LowercaseStr) :-
    atom_string(Str, Atom),
    downcase_atom(Atom, LowercaseAtom),
    atom_string(LowercaseAtom, LowercaseStr).
    write(LowercaseStr).

abc():-
    write('Enter a string: '),
    read_string(user_input, '\n', '\r', _, Str),nl,
    write('You entered: '),
    write(Str),nl,nl,
    atom_string(Str, Atom),
    downcase_atom(Atom, LowercaseAtom),
    atom_string(LowercaseAtom, LowercaseStr),
    write(LowercaseStr).