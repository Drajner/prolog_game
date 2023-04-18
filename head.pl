describe(head) :- 
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajdują się dwie skrzynia, jedna chyba jest zamknięta'), nl,
    write('Jest jeszcze trzecia skrzynia na szczycie szafy, tylko jak tam sięgnąć?'), nl.

path(head, main, main).

przedmiot_w(box_a, head).
przedmiot_w(box_b, head).
przedmiot_w(box_c, head).
przedmiot_w(wardrobe, head).

can_be_searched(box_a).

can_be_used(box_b).

can_be_searched(box_c) :-
    was_used(ladder).

can_be_searched(wardrobe).

perform_action(wardrobe) :-
    was_searched(wardrobe),
    assert(przedmiot_w(ladder, head)), nl, !.

can_be_used(ladder) :-
    was_searched(wardrobe).

perform_action(ladder) :-
    was_used(ladder),
    write("Now you have access to box C"), nl, !.

perform_action(box_a) :-
    was_searched(box_a),
    assert(przedmiot_w(key_a, head)),
    assert(przedmiot_w(map, head)),
    assert(przedmiot_w(rubiks_cube, head)),
    assert(przedmiot_w(canola_oil, head)),
    assert(przedmiot_w(chain, head)),
    assert(przedmiot_w(cement, head)),
    assert(przedmiot_w(thermos, head)),
    assert(przedmiot_w(matches, head)),
    write("Znalazłeś w skrzyni kilka przedmiotów: "), nl, !.

perform_action(box_c) :-
    assert(przedmiot_w(hammer, head)),
    assert(can_be_used(hammer)),
    write("Znalazłeś młotek :D"), nl, !.

perform_action(box_b, hammer) :-
    write('zepsułeś młotek o skrzynie, brawo'), nl,
    die.
