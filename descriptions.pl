opis :- pozycja_gracza(pokoj), not(janusz_nie_gotuje),
        write("Przy stole samotnie siedzi Seba. Janusz działa w kuchni. Na ścianie obskurnie wyglądającego pokoju będącego centralnym pomieszczeniem Orzeła 1"), nl,
        write("dumnie wisi kalendarz z roznegliżowaną kobietą. Na prawej stronie znajdowała się maleńka kuchnia. Przy wejściu na ogon znajdują się szafki należące do szeregowych."), nl,
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj), klodka_zamknieta,
        write("Przy stole w pokoju pogrywając w karty siedzą Janusz i Seba. Na ścianie obskurnie wyglądającego pokoju będącego centralnym pomieszczeniem Orzeła 1"), nl,
        write("dumnie wisi kalendarz z roznegliżowaną kobietą. Na prawej stronie znajdowała się maleńka kuchnia. Przy wejściu na ogon znajdują się szafki należące do szeregowych."), nl,
        write("Opodal włazu do śluzy leży skafander."),
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj),
        write("Przy stole w pokoju pogrywając w karty siedzą Janusz i Seba. Na ścianie obskurnie wyglądającego pokoju będącego centralnym pomieszczeniem Orzeła 1"), nl,
        write("dumnie wisi kalendarz z roznegliżowaną kobietą. Na prawej stronie znajdowała się maleńka kuchnia. Przy wejściu na ogon znajdują się szafki należące do szeregowych."), nl,
        znajdz_przedmioty(pokoj),!.
        
opis :- pozycja_gracza(skrzydlo_lewe),
        write("Lewe skrzydło ma na sobie jeden stary silnik."),nl,
        znajdz_przedmioty(skrzydlo_lewe),!.

opis :- pozycja_gracza(skrzydlo_prawe),
        write("Prawe skrzydło ma na sobie jeden stary silnik."),nl,
        znajdz_przedmioty(skrzydlo_prawe),!.

opis :- pozycja_gracza(sluza),
        write("Trzeszcząca od ciśnienia śluza nie zadowalała swoją jakością jeszcze przed wypadkiem."), nl,
        write("Teraz jest jeszcze gorzej. Na szczęście panel kontrolny nadal działa i można otworzyć śluzę."), nl,
        write("[Aby otworzyć śluzę wpisz otworz_sluze lub zamknij_sluze, aby zamknąć.]"), nl,
        znajdz_przedmioty(sluza),!.

znajdz_przedmioty(X) :- przedmiot_w(Y, X),
                        write("Leży tu "), write(Y), write("."), nl, fail,!.