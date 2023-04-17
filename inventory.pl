:- dynamic przedmiot_w/2.

:- ensure_loaded(map).

przedmiot_w(ryba, pokoj).
przedmiot_w(kij, ekwipunek).

podnies(X) :- przedmiot_w(X, ekwipunek),
            write("you got it already hoe").

podnies(X) :- pozycja_gracza(Y),
            przedmiot_w(X, not(Y)),
            write("not here").

podnies(X) :- pozycja_gracza(Y),
            przedmiot_w(X, Y),
            retract(przedmiot_w(X, Y)),
            assert(przedmiot_w(X, ekwipunek)),
            write("picked up "), write(X).

upusc(X) :- pozycja_gracza(Y),
            przedmiot_w(X, ekwipunek),
            retract(przedmiot_w(X,ekwipunek)),
            assert(przedmiot_w(X, Y)),
            write("dropped "), write(X).

upusc(X) :- write("you dont have that").