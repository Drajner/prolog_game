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
                idz/1.

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
        write("Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Należy jak najszybciej opuscic to podle miejsce. Czas wziac sie "), nl,
        write("do roboty. Aby naprawic statek należy glowny silnik, ktory doznal najwiekszych obrażeń podczas wypadku. Narzedzia "), nl,
        write("powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz-francuski i srubokret."), nl,
        write(""), nl,

        opis, !.

napraw_silnik :-
        pozycja_gracza(dziob),
        przedmiot_w(klucz_francuski, ekwipunek),
        przedmiot_w(srubokret, ekwipunek),
        przedmiot_w(mlotek, ekwipunek),
        write('Z tymi narzędziami na pewno naprawię główny silnik.'),
        write('Stuku, puku, stuku puku.'),
        write('...'),
        write('ZWYCIĘSTWO!'), !.

napraw_silnik :-
        pozycja_gracza(dziob),
        write('Potrzebne beda: mlotek, klucz_francuski i srubokret.'), !.

napraw_silnik :-
        write('Muszę być na dziobie, żeby to zrobić.'), nl,
        write("Cos musialo uderzyc w statek. To oznaczalo tylko jedno. Nalezy jak najszybciej opuscic to podle miejsce. Czas wziac sie "), nl,
        write("do roboty. Aby naprawic statek nalezy glowny silnik, ktory doznal najwiekszych obrazeń podczas wypadku. Narzedzia "), nl,
        write("powinny byc gdzies na statku. Potrzebne beda: mlotek, klucz_francuski i srubokret."), nl,
        write(""), nl, !.

instrukcja:-
            write("KOMENDY:"), nl,
            write("idz(miejsce). - pozwala poruszac sie po statku i nie tylko (dostepne miejsca to dziob, pokoj, przod_ogona, tyl_ogona, sluza, skrzydlo_prawe, skrzydlo_lewe, sterownia)"), nl,
            write("opis. - wyswietla opis miejsca"), nl,
            write("uzyj(przedmiot). - uzywa pojedynczego przedmiotu (w przypadku skafandra uzycie oznacza zalozenie lub zdjecie), czasem pozwala na dolaczenie mniejszego przedmiotu do posiadanego wiekszego"), nl,
            write("uzyj(przedmiot, przedmiot/obiekt). - uzywa przedmiotu w polaczeniu z obiektem lub innym przedmiotem"), nl,
            write("zobacz(obiekt) - pozwala przyjrzec sie obiektowi lub kierunkowi"), nl,
            write("rozmawiaj(rozmowca, temat) - pozwala na rozmowe z swiadomymi stworzeniami, o tematach im znanych (np. zolnierze i wyposarzenie pokoju, janusz tematy wedkarskie)"), nl,
            write("!nne komendy moga sie pojawic w odpowiednim dla nich momencie."), nl,
            write(""),nl,!.


:- intro, instrukcja, opis.
