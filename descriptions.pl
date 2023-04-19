
intro :- write("Miejsce: Planeta S4+KU"), nl,
        write("Misja: Nie utonac "), nl,
        write(" "), nl,
        write("As Gwiezdnej Floty kapitan Tytus Bomba podczas pogoni za groznym przemytnikiem niekacyzowanych papierosow"), nl,
        write("znanym jako Waldemar Krzak wlecial w orbite calkowicie pokrytej woda planety S4+KU. Przestepca pragnac "), nl,
        write("wymanewrowac poscig wlecial w sztorm. Zaloga Orzela 1 nie odstepowala go na krok. Niestety warunki atmosferyczne"), nl,
        write("nie okazaly sie laskawe i stracily ich z przestworzy prosto w mroczne glebiny oceanu. Ich statek zatrzymal sie gdzies"), nl,
        write("pomiedzy dnem, a powierzchnia. Teraz Kapitan Bomba oraz jego podwladni Janusz i Seba musza znalezc sposob, aby"), nl,
        write("wydostac zniszczony upadkiem pojazd z tego potrzasku..."), nl,
        write(""), nl,
        write("'Zostawcie juz te cholerne karty i wezcie sie do roboty!'"), nl,
        write("'Ale panie kapitanie my nie mamy pojecia co mamy tutaj zrobic, wiec przed smiercia mozemy sobie chociaz pograc.' - "), nl,
        write("odrzekl zrezygnowany zolnierz - 'Makao!'"), nl,
        write("'Janusz, my gramy w pokera.' - upomnial kolege Seba "), nl,
        write("'I po makale! Znowu wygralem!'"), nl,
        write("'Tepe...' - wypowiedz dowodcy przerwal nagly wstrzas."), nl,
        write("Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Nalezy jak najszybciej opuscic to podle miejsce. Czas wziac sie "), nl,
        write("do roboty. Aby naprawic statek nalezy glowny silnik, ktory doznal najwiekszych obrazen podczas wypadku. Narzedzia "), nl,
        write("powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz-francuski i srubokret."), nl,
        write(""), nl, !.

instrukcja :- write("KOMENDY:"), nl,
            write("idz(miejsce). - pozwala poruszac sie po statku i nie tylko (dostepne miejsca to dziob, pokoj, przod_ogona, tyl_ogona, sluza, skrzydlo_prawe, skrzydlo_lewe)"), nl,
            write("opis. - wyswietla opis miejsca"), nl,
            write("uzyj(przedmiot/obiekt). - uzywa pojedynczego przedmiotu (w przypadku skafandra uzycie oznacza zalozenie lub zdjecie), czasem pozwala na dolaczenie mniejszego przedmiotu do posiadanego wiekszego"), nl,
            write("uzyj(przedmiot, przedmiot/obiekt). - uzywa przedmiotu w polaczeniu z obiektem lub innym przedmiotem"), nl,
            write("podnies(przdmiot) - pozwala wziac przedmiot do ekwipunku"), nl,
            write("ekwipunek. - wypisuje przedmioty ktore sa w ekwipunku"), nl,
            write("zobacz(obiekt) - pozwala przyjrzec sie obiektowi lub kierunkowi"), nl,
            write("rozmawiaj(rozmowca, temat) - pozwala na rozmowe z swiadomymi stworzeniami, o tematach im znanych (np. zolnierze i wyposarzenie pokoju, janusz tematy wedkarskie)"), nl,
            write("napraw_silnik. - pozwala naprawic silnik i ukonczyc gre, gdy w posiadaniu sa mlotek, srubokret i klucz-francuski, a takze jest sie na dziobie"), nl,
            write("instrukcja. - pokazuje liste komend"),
            write("Inne komendy moga sie pojawic w odpowiednim dla nich momencie."), nl,
            write(""),nl,!.

opis :- pozycja_gracza(pokoj), not(janusz_nie_gotuje),
        write("Przy stole samotnie siedzi Seba. Janusz dziala w kuchni. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj), klodka_zamknieta, janusz_nie_gotuje,
        write("Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
        write("Opodal wlazu do sluzy lezy skafander."),
        znajdz_przedmioty(pokoj),!.

opis :- pozycja_gracza(pokoj), not(klodka_zamknieta), janusz_nie_gotuje,
        write("Przy stole w pokoju pogrywajac w karty siedza Janusz i Seba. Na scianie obskurnie wygladajacego pokoju bedacego centralnym pomieszczeniem Orzela 1"), nl,
        write("dumnie wisi kalendarz z rozneglizowana kobieta. Na prawej stronie znajdowala sie malenka kuchnia. Przy wejsciu na ogon znajduja sie szafki nalezace do szeregowych."), nl,
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
        write('Twoim oczom ukazuje sie szara, lekko oswietlona, podluzna przestrzen.'), nl,
        write('Mozesz isc na tyl ogona.'), nl,
        write('Mozesz zobaczyc co jest na prawo lub na lewo.'), nl,
        znajdz_przedmioty(przod_ogona),!.

opis :-
        pozycja_gracza(tyl_ogona),
        zamknieta_skrzynka_na_narzedzia,
        write('Stoi tu niewielka skrzynka na narzedzia ... albo raczej na narzedzie.
Jej rozmiar pozostawia wiele watpliwosci. Jest zamknieta na nietypowa klódke,
sa na niej trzy przyciski: <^>v chyba nalezy je wcisnac w jakiejs sekwencji.
Aby wpisac haslo napisz: haslo(skrzynka, [sekwencja])'), nl,
        write('Oprócz tego moge rozejrzec sie w prawo lub w lewo.'), nl,
        znajdz_przedmioty(tyl_ogona),!.

opis :-
        pozycja_gracza(tyl_ogona),
        \+zamknieta_skrzynka_na_narzedzia,
        przedmiot_w(klucz-francuski, tyl_ogona),
        write('W skrzynce jest klucz francuski (klucz-francuski).'), nl,
        znajdz_przedmioty(tyl_ogona),!.

opis :-
        pozycja_gracza(tyl_ogona),
        \+zamknieta_skrzynka_na_narzedzia,
        \+przedmiot_w(klucz-francuski, tyl_ogona),
        write('Skrzynia jest pusta.'), nl,
        znajdz_przedmioty(tyl_ogona),!.

opis:- pozycja_gracza(dziob),
        write('Kapitan znalazł się na dziobie statku. Na przedzie pomieszczenia charczy niesprawny silnik. Zeby opuscic to przeklete miejsce trzeba go naprawic.'), nl,
        write('W pomieszczeniu znajduje sie szafa, na niej lezy skrzynia, jednak nie jest tak latwo dosiegalna. Gdzies tu powinien lezec mlotek, jesli pamiec Bomby go nie myli.'), nl,
        znajdz_przedmioty(dziob),!.

znajdz_przedmioty(X) :- przedmiot_w(Y, X),
                        write("Lezy tu "), write(Y), write("."), nl, fail,!.