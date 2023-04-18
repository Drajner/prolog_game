opis :- pozycja_gracza(pokoj), not(janusz_nie_gotuje),
        write("Przy stole samotnie siedzi Seba. Janusz dziala w kuchni. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie maleńka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj), klodka_zamknieta, janusz_nie_gotuje,
        write("Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie maleńka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
        write("Opodal wlazu do sluzy lezy skafander."),
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj), not(klodka_zamknieta), janusz_nie_gotuje,
        write("Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie maleńka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(skrzydlo_lewe),
        write("Lewe skrzydlo ma na sobie jeden stary silnik."),nl,
        znajdz_przedmioty(skrzydlo_lewe),!.

opis :- pozycja_gracza(skrzydlo_prawe),
        write("Prawe skrzydlo ma na sobie jeden stary silnik."),nl,
        znajdz_przedmioty(skrzydlo_prawe),!.

opis :- pozycja_gracza(sluza),
        write("Trzeszczaca od cisnienia sluza nie zadowalala swoja jakoscia jeszcze przed wypadkiem."), nl,
        write("Teraz jest jeszcze gorzej. Na szczescie panel kontrolny nadal dziala i mozna otworzyc sluze."), nl,
        write("[Aby otworzyc sluze wpisz otworz_sluze lub zamknij_sluze, aby zamknac.]"), nl,
        znajdz_przedmioty(sluza),!.

opis :-
        pozycja_gracza(przod_ogona),
        write('Twoim oczom ukazuje się szara, lekko oświetlona, podłużna przestrzeń.'), nl,
        write('Możesz iść na tył ogona.'), nl,
        write('Możesz zobaczyć co jest na prawo lub na lewo.'), nl.

opis :-
        pozycja_gracza(tyl_ogona),

opis :-
        pozycja_gracza(tyl_ogona),
        zamknieta_skrzynka_na_narzędzia,
        write('Stoi tu niewielka skrzynka na narzędzia … albo raczej na narzędzie.
Jej rozmiar pozostawia wiele wątpliwości. Jest zamknięta na nietypową kłódkę,
są na niej trzy przyciski: <^>v chyba należy je wcisnąć w jakiejś sekwencji.
Aby wpisać hasło napisz: haslo(skrzynka, [sekwencja])'), nl,
        write('Oprócz tego mogę rozejrzeć się w prawo lub w lewo.'), nl.

opis :-
        pozycja_gracza(tyl_ogona),
        \+zamknieta_skrzynka_na_narzędzia,
        przedmiot_w(klucz-francuski, tyl_ogona),
        write('W skrzynce jest klucz francuski (klucz-francuski).'), nl.

opis :-
        pozycja_gracza(tyl_ogona),
        \+zamknieta_skrzynka_na_narzędzia,
        \+przedmiot_w(klucz-francuski, tyl_ogona),
        write('Już nic tutaj nie ma.'), nl.

znajdz_przedmioty(X) :- przedmiot_w(Y, X),
                        write("Lezy tu "), write(Y), write("."), nl, fail,!.