describe(head) :- 
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajdują się dwie skrzynia, jedna chyba jest zamknięta'), nl,
    write('Jest jeszcze trzecia skrzynia na szczycie szafy, tylko jak tam sięgnąć?'), nl.

at(box_a, head).
at(box_b, head).
at(box_c, head).
at(wardrobe, head).

path(head, main, main).

can_be_searched(wardrobe) :-
    i_am_at(head).

perform_action(wardrobe) :-
    was_searched(wardrobe),
    assert(at(ladder, head)),
    write("Znalazłeś drabinę"), nl, !.

can_be_used(ladder) :-
    was_searched(wardrobe),
    i_am_at(head),
    at(ladder, head).

perform_action(ladder) :-
    was_used(ladder),
    assert(can_be_used(box_b)),
    write("Now you have access to box B"), nl, !.



