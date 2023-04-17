describe(main) :- write('Znajdujesz się w sterowni. To chyba tutaj naprawisz statek. Ale będziesz potrzebować narzędzi'), nl.

at(engine, main).

perform_action(engine) :-
    holding(hammer),
    write('Gratulacje statek naprawiony, gra skończona'), nl,
    finish, !.
