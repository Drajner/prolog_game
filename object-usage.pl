:- dynamic was_used/1,
        mozna_uzyc/1,
        was_przeszukajed/1,
        mozna_przeszukac/1,
        wykonaj_akcje/1,
        wykonaj_akcje/2.

wykonaj_akcje(_).

use(X) :- was_used(X),
        write("it has been already used"), nl, !.

use(X) :- not(mozna_uzyc(X)),
        write("this item cannot be used"), nl, fail.

use(X) :- mozna_uzyc(X),
        pozycja_gracza(Place),
        przedmiot_w(X, Place),
        assert(was_used(X)),
        wykonaj_akcje(X),
        write("Użyto "), X, nl, !.

przeszukaj(X) :- was_przeszukajed(X),
        write("Ten obiekt był już przeszukiwany"), nl, !.

przeszukaj(X) :- not(mozna_przeszukac(X)),
        write('Tego obiektu nie da się przeszukać'), nl, fail.

przeszukaj(X) :- mozna_przeszukac(X),
        pozycja_gracza(Place),
        przedmiot_w(X, Place),
        assert(was_przeszukajed(X)),
        wykonaj_akcje(X),
        write("successfully przeszukajed"), nl,
        notice_objects_here, !.

uzyj_przedmiotu_na(X, Y) :-
        holding(Y),
        mozna_uzyc(Y),
        mozna_uzyc(X),
        assert(was_used(X)),
        wykonaj_akcje(X, Y).

    
        