:- dynamic zamkniete_szklane_drzwiczki/0.
:- dynamic zamkniete_dolne_drzwiczki/0.
:- dynamic farba_nie_zdrapana/0.
:- dynamic zamknieta_skrzynka_na_narzedzia/0.

zamkniete_szklane_drzwiczki.
zamkniete_dolne_drzwiczki.
farba_nie_zdrapana.
zamknieta_skrzynka_na_narzedzia.

przedmiot_w(haczyk, przod_ogona).
przedmiot_w(szalik, tyl_ogona).
przedmiot_w(ksiazka, przod_ogona).

zobacz(przod_ogona) :-
            pozycja_gracza(przod_ogona),
            write('Twoim oczom ukazuje się szara, lekko oświetlona, podłużna przestrzeń.'), nl,
            write('Możesz iść na tył ogona.'), nl,
            write('Możesz zobaczyć co jest na prawo lub na lewo.'), nl.

zobacz(prawo) :-
            pozycja_gracza(przod_ogona),
            write('Twoim oczom ukazał się stary brzydki kredens.
Na górze przeszklony (szklane_drzwiczki), na dole są drzwiczki do szafki (dolne-drzwiczki),
pomiędzy, na blacie leży jakaś książka.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            przedmiot_w(haczyk, przod_ogona),
            write('Ktoś wbił haczyk w ścianę.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            \+przedmiot_w(haczyk, przod_ogona),
            write('Nic tu nie ma.'), nl.

% --------------- KREDENS ----------------

zobacz(szklane_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            zamkniete_szklane_drzwiczki,
            write('Ani drgną, chyba się zacięły.'), nl.

zobacz(szklane_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            write('Ktoś widocznie grał na tyle w kółko i krzyżyk.
W dodatku bardzo nieudolnie, są tam też jakieś znaki bez sensu.
Z wyjątkowymi imbecylami przyszło mi dzielić tą podróż.'), nl,
            write('< | x | o'), nl,
            write('—--------'), nl,
            write('o | o | >'), nl,
            write('—--------'), nl,
            write('^ | ^ | >'), nl.

zobacz(ksiazka) :-
            pozycja_gracza(przod_ogona),
            write('Nie lubię czytać.'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            zamkniete_dolne_drzwiczki,
            write('Zamknięte, na kłódce jest klawiatura literowa do wpisania hasła, limit to 8 znaków. (haslo(dolne_drzwiczki, [haslo]))'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            \+zamkniete_dolne_drzwiczki,
            przedmiot_w(kula_do_kregli, przod_ogona),
            write('W środku jest kula do kręgli.'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            \+zamkniete_dolne_drzwiczki,
            \+przedmiot_w(kula_do_kregli, przod_ogona),
            write('Nic tu nie ma.'), nl.

haslo(dolne_drzwiczki, kapibara) :-
            pozycja_gracza(przod_ogona),
            retractall(zamkniete_dolne_drzwiczki),
            assert(przedmiot_w(kula_do_kregli, przod_ogona)),
            write('Kłódka otwiera się. W środku znajduje się kula do kregli (kula_do_kregli).'), nl.

haslo(dolne_drzwiczki, _) :-
            pozycja_gracza(przod_ogona),
            write('Nic się nie stało.'), nl.


uzyj(szalik, kula_do_kregli) :-
            write('Można tym coś rozwalić albo zabić.'), nl,
            assert(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(przedmiot_w(kula_do_kregli, ekwipunek)),
            retract(przedmiot_w(szalik, ekwipunek)),
            write('Przedmiot kula_w_szaliku ląduje w ekwipunku.'), nl.

uzyj(kula_do_kregli, szalik) :-
            write('Można tym coś rozwalić albo zabić.'), nl,
            assert(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(przedmiot_w(kula_do_kregli, ekwipunek)),
            retract(przedmiot_w(szalik, ekwipunek)),
            write('Przedmiot kula_w_szaliku ląduje w ekwipunku.'), nl.

uzyj(kula_w_szaliku, szklane_drzwiczki) :-
            przedmiot_w(kula_w_szaliku, ekwipunek),
            retract(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(zamkniete_szklane_drzwiczki),
            write('BAM! Otwarte.'), nl,
            write('Ktoś widocznie grał na tyle w kółko i krzyżyk.
W dodatku bardzo nieudolnie, są tam też jakieś znaki bez sensu.
Z wyjątkowymi imbecylami przyszło mi dzielić tą podróż.'), nl,
            write('< | x | o'), nl,
            write('—--------'), nl,
            write('o | o | >'), nl,
            write('—--------'), nl,
            write('^ | ^ | >'), nl.


% --------TYŁ OGONA-----------

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            zamknieta_skrzynka_na_narzedzia,
            write('Stoi tu niewielka skrzynka na narzędzia … albo raczej na narzędzie.
Jej rozmiar pozostawia wiele wątpliwości. Jest zamknięta na nietypową kłódkę,
są na niej trzy przyciski: <^>v chyba należy je wcisnąć w jakiejś sekwencji.
Aby wpisać hasło napisz: haslo(skrzynka, [sekwencja])'), nl,
            write('Oprócz tego mogę rozejrzeć się w prawo lub w lewo.'), nl.

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            \+zamknieta_skrzynka_na_narzedzia,
            przedmiot_w(klucz_francuski, tyl_ogona),
            write('W skrzynce jest klucz francuski (klucz-francuski).'), nl.

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            \+zamknieta_skrzynka_na_narzedzia,
            \+przedmiot_w(klucz_francuski, tyl_ogona),
            write('Już nic tutaj nie ma.'), nl.

haslo(skrzynka, <>^^>) :-
            pozycja_gracza(tyl_ogona),
            retractall(zamknieta_skrzynka_na_narzedzia),
            assert(przedmiot_w(klucz_francuski, tyl_ogona)),
            write('Skrzynka otwarta, w środku jest klucz francuski (klucz-_francuski).'),
            nl.

haslo(skrzynka, _) :-
            pozycja_gracza(tyl_ogona),
            zamknieta_skrzynka_na_narzedzia,
            write('Niepoprawne.'), nl.

zobacz(prawo) :-
            pozycja_gracza(tyl_ogona),
            farba_nie_zdrapana,
            write('Na ścianie wisi obrazek wsi polskiej.
Jeden szczegół zwraca uwagę … na polu stoi sobie pies o trzech nogach.
Biedak musiał wiele przeżyć. Farba na niebie wygląda jakby była świeższa od reszty.
Ktoś chciał coś zamalować.'), nl.

zobacz(prawo) :-
            pozycja_gracza(tyl_ogona),
            \+farba_nie_zdrapana,
            write('Na ścianie wisi obraz wsi polskiej.
Jeden szczegół zwraca uwagę … na polu stoi sobie pies o trzech nogach.
Biedak musiał wiele przeżyć. Na niebie jest napisane “mcsldctc” pewnie jakiś analfabeta to pisał.'), nl.

uzyj(haczyk, obraz) :-
            pozycja_gracza(tyl_ogona),
            przedmiot_w(haczyk, ekwipunek),
            retract(przedmiot_w(haczyk, ekwipunek)),
            retractall(farba_nie_zdrapana),
            write('Jest tu napisane “mcsldctc” pewnie jakiś analfabeta to pisał.'), nl.

zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            przedmiot_w(szalik, tyl_ogona),
            write('W kącie leży szalik z napisem POLSKA MISTRZEM POLSKI w kolorach białym i czerwonym (szalik).'), nl.

zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            \+przedmiot_w(szalik, tyl_ogona),
            write('Nic tu nie ma.'), nl.

