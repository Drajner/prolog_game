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
        write("Kapitan Bomba wlasnie tam jest"), !, nl.

idz(X) :- miejsce(X),
        pozycja_gracza(Y),
        takie_same_miejsca(X,Y),
        retractall(pozycja_gracza(_)),
        assert(pozycja_gracza(X)),
        write("Kapitan udal sie do "), write(X), !, nl.

idz(_) :-
        \+pozycja_gracza(Y),
        \+takie_same_miejsca(X,Y),
        write("Niestety nie da sie tam pójsc.").

otworz_sluze :- pozycja_gracza(sluza),
                not(miejsce_na_pokladzie(sluza)),
                write("Nie ma potrzeby otwierac dobrze otwartej sluzy"),!,nl.

otworz_sluze :- pozycja_gracza(sluza),
                not(bez_skafandra),
                retract(miejsce_na_pokladzie(sluza)),
                write("sluza skrzypiac niemilosiernie, wypelnia sie woda. Po paru chwilach wypelnia sie calkowicie i otwiera wyjscie."),!, nl.

otworz_sluze :- pozycja_gracza(sluza),
                write("Otwarcie sluzy bez zadnego zabezpieczenia nie bylo najrozsadniejszym pomyslem."),nl,
                write("Wejscie na statek zostalo zablokowane, a woda sprawnie zaczela wypelniac pomieszczenie wypierajac tlen."), nl,
                write("Po chwili nie bylo juz czym oddychac. Kapitan utonal zanim zdazyl sklac wszystkich projektantów tego statku."), nl,
                write("KONIEC GRY"), !, nl,
                die.

zamknij_sluze :- pozycja_gracza(sluza),
                 miejsce_na_pokladzie(sluza),
                 write("Ta sluza bardziej sie juz nie zamknie."), !, nl.

zamknij_sluze :- pozycja_gracza(sluza),
                 assert(miejsce_na_pokladzie(sluza)),
                 write("Maszyneria z duzym trudem wymienia wode na powietrze. Po sporym oczekiwaniu wrota na statek otwieraja sie."), !, nl.
