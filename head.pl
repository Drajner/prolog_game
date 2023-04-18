opis(dziob) :- 
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajdują się dwie skrzynia, jedna chyba jest zamknięta'), nl,
    write('Jest jeszcze trzecia skrzynia na szczycie szafy, tylko jak tam sięgnąć?'), nl.

przedmiot_w(box_a, dziob).
przedmiot_w(box_b, dziob).
przedmiot_w(box_c, dziob).
przedmiot_w(wardrobe, dziob).

mozna_przeszukac(box_a).

mozna_uzyc(box_b).

mozna_przeszukac(box_c) :-
    was_used(ladder).

mozna_przeszukac(wardrobe).

wykonaj_akcje(wardrobe) :-
    was_przeszukajed(wardrobe),
    assert(przedmiot_w(ladder, dziob)), nl, !.

mozna_uzyc(ladder) :-
    was_przeszukajed(wardrobe).

wykonaj_akcje(ladder) :-
    was_used(ladder),
    write("Now you have access to box C"), nl, !.

wykonaj_akcje(box_a) :-
    was_przeszukajed(box_a),
    assert(przedmiot_w(key_a, dziob)),
    assert(przedmiot_w(map, dziob)),
    assert(przedmiot_w(rubiks_cube, dziob)),
    assert(przedmiot_w(canola_oil, dziob)),
    assert(przedmiot_w(chain, dziob)),
    assert(przedmiot_w(cement, dziob)),
    assert(przedmiot_w(thermos, dziob)),
    assert(przedmiot_w(matches, dziob)),
    write("Znalazłeś w skrzyni kilka przedmiotów: "), nl, !.

wykonaj_akcje(box_c) :-
    assert(przedmiot_w(hammer, dziob)),
    assert(mozna_uzyc(hammer)),
    write("Znalazłeś młotek :D"), nl, !.

wykonaj_akcje(box_b, hammer) :-
    write('zepsułeś młotek o skrzynie, brawo'), nl,
    die.
