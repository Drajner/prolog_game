:- dynamic przedmiot_w/2.

podnies(X) :- przedmiot_w(X, ekwipunek),
            write("Kapitan trzyma juz ten przedmiot w ekwipunku."), !, nl.

podnies(X) :- pozycja_gracza(Y),
            przedmiot_w(X, Y),
            retract(przedmiot_w(X, Y)),
            assert(przedmiot_w(X, ekwipunek)),
            write("Bomba podnosi "), write(X), !, nl.

podnies(_) :- write("Nie ma tu takiego przedmiotu."), nl.

upusc(X) :- pozycja_gracza(Y),
            przedmiot_w(X, ekwipunek),
            retract(przedmiot_w(X,ekwipunek)),
            assert(przedmiot_w(X, Y)),
            write("Kapitan upuszcza "), write(X), !, nl.

upusc(_) :- write("Kapitan nie dysponuje takim przedmiotem.").

ekwipunek :- przedmiot_w(X, ekwipunek),
            write(X), nl, fail, !.