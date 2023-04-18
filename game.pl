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
        write("As Gwiezdnej Floty kapitan Tytus Bomba podczas pogoni za groźnym przemytnikiem niekacyzowanych papierosów"), nl,
        write("znanym jako Waldemar Krzak wleciał w orbitę całkowicie pokrytej wodą planety S4+KU. Przestępca pragnąc "), nl,
        write("wymanewrować pościg wleciał w sztorm. Załoga Orzeła 1 nie odstępowała go na krok. Niestety warunki atmosferyczne"), nl,
        write("nie okazały się łaskawe i strąciły ich z przestworzy prosto w mroczne głebiny oceanu. Ich statek zatrzymał się gdzieś"), nl,
        write("pomiędzy dnem, a powierzchnią. Teraz Kapitan Bomba oraz jego podwładni Janusz i Seba muszą znaleźć sposób, aby"), nl,
        write("wydostać zniszczony upadkiem pojazd z tego potrzasku..."), nl,
        write(""), nl,
        write("'Zostawcie już te cholerne karty i weźcie się do roboty!'"), nl,
        write("'Ale panie kapitanie my nie mamy pojęcia co mamy tutaj zrobić, więc przed śmiercią możemy sobie chociaż pograć.' - "), nl,
        write("odrzekł zrezygnowany żołnierz - 'Makao!'"), nl,
        write("'Janusz, my gramy w pokera.' - upomniał kolegę Seba "), nl,
        write("'I po makale! Znowu wygrałem!'"), nl,
        write("'Tępe...' - wypowiedź dowódcy przerwał nagły wstrząs."), nl,
        write("Coś musiało uderzyć w statek. To oznaczało tylko jedno. Należy jak najszybciej opuścić to podłe miejsce. Czas wziąć się "), nl,
        write("do roboty. Aby naprawić statek należy główny silnik, który doznał największych obrażeń podczas wypadku. Narzędzia "), nl,
        write("powinny być gdzieś na statku. Potrzebne będą: mlotek, klucz-francuski i srubokret."), nl,
        write(""), nl,
        opis, !.