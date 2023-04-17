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
        write("Kapitan Bomba właśnie tam jest").

idz(X) :- miejsce(X),
        pozycja_gracza(Y),
        takie_same_miejsca(X,Y),
        retractall(pozycja_gracza(_)),
        assert(pozycja_gracza(X)),
        write("Kapitan udał się do "), write(X).

idz(_) :- write("Niestety nie da się tam pójść.").

otworz_sluze :- pozycja_gracza(sluza),
                not(miejsce_na_pokladzie(sluza)),
                write("Nie ma potrzeby otwierać dobrze otwartej śluzy").

otworz_sluze :- pozycja_gracza(sluza),
                w_skafandrze,
                retract(miejsce_na_pokladzie(sluza)),
                write("Śluza skrzypiąc niemiłosiernie, wypełnia się wodą. Po paru chwilach wypełnia się całkowicie i otwiera wyjście."),
                write()

otworz_sluze :- pozycja_gracza(sluza),
                write("Otwarcie śluzy bez żadnego zabezpieczenia nie było najrozsądniejszym pomysłem."),nl,
                write("Wejście na statek zostało zablokowane, a woda sprawnie zaczęła wypełniać pomieszczenie wypierając tlen."), nl,
                write("Po chwili nie było już czym oddychać. Kapitan utonął zanim zdążył skląć wszystkich projektantów tego statku."), nl,
                write("KONIEC GRY"), nl,
                die.

zamknij_sluze :- pozycja_gracza(sluza),
                 miejsce_na_pokladzie(sluza),
                 write("Ta śluza bardziej się już nie zamknie.").

zamknij_sluze :- pozycja_gracza(sluza),
                 assert(miejsce_na_pokladzie(sluza)),
                 write("Maszyneria z dużym trudem wymienia wodę na powietrze. Po sporym oczekiwaniu wrota na statek otwierają się.").
