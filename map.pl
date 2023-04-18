:- dynamic pozycja_gracza/1, miejsce_na_pokladzie/1.

miejsce(dziob).
miejsce(pokoj).
miejsce(przod_ogona).
miejsce(tyl_ogona).
miejsce(sluza).
miejsce(skrzydlo_prawe).
miejsce(skrzydlo_lewe).

miejsce_na_pokladzie(dziob).
miejsce_na_pokladzie(pokoj).
miejsce_na_pokladzie(przod_ogona).
miejsce_na_pokladzie(tyl_ogona).
miejsce_na_pokladzie(sluza).

pozycja_gracza(pokoj).

not(X) :- X, !, fail ; true.

takie_same_miejsca(X, Y) :- miejsce_na_pokladzie(X),
                            miejsce_na_pokladzie(Y).

takie_same_miejsca(X, Y) :- not(miejsce_na_pokladzie(X)),
                            not(miejsce_na_pokladzie(Y)).

idz(X) :- pozycja_gracza(X),
        write("u there hoe").

idz(X) :- miejsce(X),
        pozycja_gracza(Y),
        takie_same_miejsca(X,Y),
        retractall(pozycja_gracza(_)),
        assert(pozycja_gracza(X)),
        write("gone "), write(X).

idz(_) :-
        \+pozycja_gracza(Y),
        \+takie_same_miejsca(X,Y),
        write("no way").

otworz_sluze :- pozycja_gracza(sluza),
                not(miejsce_na_pokladzie(sluza)),
                write("juz otwarta").

otworz_sluze :- pozycja_gracza(sluza),
                retract(miejsce_na_pokladzie(sluza)),
                write("sluza otwarta").

zamknij_sluze :- pozycja_gracza(sluza),
                 miejsce_na_pokladzie(sluza),
                 write("juz zamknieta").

zamknij_sluze :- pozycja_gracza(sluza),
                 assert(miejsce_na_pokladzie(sluza)),
                 write("sluza zamknieta").
