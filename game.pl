:- dynamic chuda_ryba_niezlapana/0,
    klodka_zamknieta/0,
    skafander_niezbadany/0,
    janusz_nie_gotuje/0,
    bez_skafandra/0,
    gruba_ryba_niezlapana/0,
    szafka_janusza_zamknieta/0.


:- ensure_loaded(map),
    ensure_loaded(inventory),
    ensure_loaded(wings),
    ensure_loaded(pokoj),
    ensure_loaded(dialogue),
    ensure_loaded(items),
    ensure_loaded(descriptions),
    ensure_loaded(tail),
    ensure_loaded(head),
    ensure_loaded(object_usage).

:- intro.

die :- finish.

finish :-
        nl,
        write('Prosze wpisz "halt." !'),
        nl.

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
        write("'Zostawcie już te cholerne karty i wezcie sie do roboty!'"), nl,
        write("'Ale panie kapitanie my nie mamy pojecia co mamy tutaj zrobic, wiec przed smiercia możemy sobie chociaż pograc.' - "), nl,
        write("odrzekl zrezygnowany żolnierz - 'Makao!'"), nl,
        write("'Janusz, my gramy w pokera.' - upomnial kolege Seba "), nl,
        write("'I po makale! Znowu wygralem!'"), nl,
        write("'Tepe...' - wypowiedz dowodcy przerwal nagly wstrzas."), nl,
        write("Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Należy jak najszybciej opuscic to podle miejsce. Czas wziac sie "), nl,
        write("do roboty. Aby naprawic statek należy glowny silnik, ktory doznal najwiekszych obrażeń podczas wypadku. Narzedzia "), nl,
        write("powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz-francuski i srubokret."), nl,
        write(""), nl,

        opis, !.

napraw_silnik :-
        pozycja_gracza(dziob),
        przedmiot_w(klucz_francuski, ekwipunek),
        przedmiot_w(srubokret, ekwipunek),
        write('Z tymi narzędziami na pewno naprawię główny silnik.'),
        write('Stuku, puku, stuku puku.'),
        write('...'),
        write('ZWYCIĘSTWO!'), !.

napraw_silnik :-
        pozycja_gracza(dziob),
        przedmiot_w(klucz_francuski, ekwipunek),
        write('Potrzebuję śrubokręta, żeby dostać się do środka.'), !.

napraw_silnik :-
        pozycja_gracza(dziob),
        przedmiot_w(srubokret, ekwipunek),
        write('Żeby wymienić śróby potrzebny będzie klucz francuski.'), !.

napraw_silnik :-
        pozycja_gracza(dziob),
        write('Potrzebuję śrubokręta i klucza francuskiego.'), !.

napraw_silnik :-
        write('Muszę być na dziobie, żeby to zrobić.'), !.