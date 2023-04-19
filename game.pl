:- dynamic chuda_ryba_niezlapana/0,
    klodka_zamknieta/0,
    skafander_niezbadany/0,
    janusz_nie_gotuje/0,
    bez_skafandra/0,
    gruba_ryba_niezlapana/0,
    szafka_janusza_zamknieta/0,

    zamkniete_szklane_drzwiczki/0,
    zamkniete_dolne_drzwiczki/0,
    farba_nie_zdrapana/0,
    zamknieta_skrzynka_na_narzedzia/0,

    drabina_w_szafie/0.

:- discontiguous uzyj/2,
                uzyj/1,
                zobacz/1,
                rozmawiaj/2,
                idz/1,
                przedmiot_w/2,
                haslo/2.

:- ensure_loaded(map).
:- ensure_loaded(inventory).
:- ensure_loaded(locations).
:- ensure_loaded(dialogue).
:- ensure_loaded(items).
:- ensure_loaded(descriptions).


die :- finish.

finish :-
        nl,
        write('Prosze wpisz "halt." !'),
        nl.



napraw_silnik :-
        pozycja_gracza(dziob),
        przedmiot_w(klucz_francuski, ekwipunek),
        przedmiot_w(srubokret, ekwipunek),
        przedmiot_w(mlotek, ekwipunek),
        write('Z tymi narzedziami na pewno naprawie glówny silnik.'),
        write('Stuku, puku, stuku puku.'),
        write('...'),
        write('ZWYCIESTWO!'), !.

napraw_silnik :-
        pozycja_gracza(dziob),
        write('Potrzebne beda: mlotek, klucz_francuski i srubokret.'), !.

napraw_silnik :-
        write('Musze być na dziobie, żeby to zrobić.'), nl,
        write("Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Nalezy jak najszybciej opuscic to podle miejsce. Czas wziac sie "), nl,
        write("do roboty. Aby naprawic statek nalezy glowny silnik, ktory doznal najwiekszych obrazen podczas wypadku. Narzedzia "), nl,
        write("powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz_francuski i srubokret."), nl,
        write(""), nl, !.


:- intro.
:- instrukcja.
:- opis.

