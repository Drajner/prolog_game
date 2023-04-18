:- dynamic drabina_w_szafie/0.

zobacz(dziob) :-
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajduje się szafa, na niej leży skrzynia, jednak nie sięgnę tak łatwo.'), nl.
path(dziob, main, main).

przedmiot_w(skrzynia, dziob).
przedmiot_w(szafa, dziob).

zobacz(szafa) :-
    pozycja_gracza(dziob),
    drabina_w_szafie,
    assert(przedmiot_w(drabina, dziob)),
    retractall(drabina_w_szafie),
    write('Jest tu drabina.'), !.

zobacz(szafa) :-
    write('Nic tu nie ma'), !.

uzyj(drabina, szafa) :-
    pozycja_gracza(dziob),
    przedmiot_w(drabina, ekwipunek),
    assert(przedmiot_w(mlotek, dziob)),
    write("W skrzyni jest młotek!"), nl, !.
