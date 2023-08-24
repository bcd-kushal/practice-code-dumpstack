is_palindrome_str(Str) :-
    string_chars(Str, Chars),
    is_palindrome(Chars).

is_palindrome([]).
is_palindrome([_]).
is_palindrome([H|T]) :-
    append(Mid, [H], T),
    is_palindrome(Mid).