describe(head) :- 
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajdują się dwie skrzynia, jedna chyba jest zamknięta'), nl,
    write('Jest jeszcze trzecia skrzynia na szczycie szafy, tylko jak tam sięgnąć?'), nl.

path(head, main, main).

at(box_a, head).
at(box_b, head).
at(box_c, head).
at(wardrobe, head).

can_be_searched(box_a) :-
    i_am_at(head),
    at(box_a, head).

can_be_searched(wardrobe) :-
    i_am_at(head).

perform_action(wardrobe) :-
    was_searched(wardrobe),
    assert(at(ladder, head)), nl, !.

can_be_used(ladder) :-
    was_searched(wardrobe),
    i_am_at(head),
    at(ladder, head).

perform_action(ladder) :-
    was_used(ladder),
    assert(can_be_searched(box_b)),
    write("Now you have access to box B"), nl, !.

perform_action(box_a) :-
    was_searched(box_a),
    assert(at(key_a, head)),
    assert(at(map, head)),
    assert(at(rubiks_cube, head)),
    assert(at(canola_oil, head)),
    assert(at(chain, head)),
    assert(at(cement, head)),
    assert(at(thermos, head)),
    assert(at(matches, head)),
    write("Znalazłeś w skrzyni kilka przedmiotów: "), nl, !.

perform_action(box_b) :-
    assert(at(hammer, head)), 
    write("Znalazłeś młotek :D"), nl, !.
