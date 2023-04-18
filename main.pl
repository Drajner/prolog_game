describe(main) :- write('Znajdujesz się w sterowni. To chyba tutaj naprawisz statek. Ale będziesz potrzebować narzędzi'), nl.

przedmiot_w(engine, main).

can_be_used(engine) :-
    holding(hammer).

perform_action(engine) :-
    was_used(engine),
    write('Gratulacje statek naprawiony, gra skończona'), nl,
    finish, !.
