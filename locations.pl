

:- dynamic skafander_niezbadany/0.

klodka_zamknieta.
janusz_nie_gotuje.
skafander_niezbadany.
bez_skafandra.
szafka_janusza_zamknieta.

drabina_w_szafie.

zamkniete_szklane_drzwiczki.
zamkniete_dolne_drzwiczki.
farba_nie_zdrapana.
zamknieta_skrzynka_na_narzedzia.

% pokoj

zobacz(kalendarz) :- pozycja_gracza(pokoj), 
                    write("Modelka kusi oczy kapitana. To juz koncowka marca."), nl,
                    write("Dokladniej 26 marca 2039 roku. Za 2 tygodnie powinna przyjsc wyplata i znowu bedzie sie mozna napic."), nl,
                    write("Byleby nie skończyc tak jak w Nowy Rok dwa lata temu. Wtedy to byla tragedia... Przez bite dwa dni Bomba byl nie do zycia. "), nl,
                    write("Ledwo prowadzil rakiete. Nie dotarl na narodziny swojego syna, chociaz i tak by tego nie pamietal."), nl,
                    write("Dzień po pierwszym stycznia nie zatrzymal sie w jego pamieci. Aldona nadal ma mu to za zle."), nl,!.

zobacz(kuchnia) :- pozycja_gracza(pokoj),
                    not(janusz_nie_gotuje),
                    write("Janusz usilnie próbuje dojsc do porozumienia z otaczajacym go syfem."), nl,
                    write("Patrzac na tempo jego dzialań kapitan dochodzi do wniosku, ze chwile to potrwa zanim dostana kolacje."),!.

zobacz(kuchnia) :-  pozycja_gracza(pokoj),
                    write("Potworny syf rzucal sie w oczy. Brudne naczynia lezaly wszedzie."), nl,!.



zobacz(skafander) :- klodka_zamknieta,
                    pozycja_gracza(pokoj),
                    write("Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczeństwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
                    write("Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."), nl,
                    write("Niestety skafander zostal zablokowany klódka z zamkiem na 4 cyfry i przypieta karteczka z napisem:"), nl,
                    write("'Kod to data urodzin naszego Brajanka, mam nadzieje ze pamietasz!'"), nl,
                    write("'Kurrr...' - wycedzil przez zeby Bomba. - 'Trudne...' -> zobacz_klodke."), nl,
                    write("[Aby podac kod do klodki, wpisz_kod(XXXX)]"), nl,
                    retract(skafander_niezbadany),!.

zobacz(skafander) :- write("Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczeństwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
                    write("Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."), nl,!.

wpisz_kod(2137) :-  klodka_zamknieta,
                    not(skafander_niezbadany),
                    pozycja_gracza(pokoj),
                    write("'Nareszcie... 02.01.2037. Aldona nie moglas czegos latwiejszego wybrac?' - wyrzucil pod nosem Bomba otwierajac zamek."), nl,
                    write("Teraz mozna zabrac skafander [komenda podnies]"),

                    assert(przedmiot_w(skafander, pokoj)),
                    retractall(klodka_zamknieta),!.

wpisz_kod(_) :-     klodka_zamknieta,
                    not(skafander_niezbadany),
                    pozycja_gracza(pokoj),
                    write("Palaki klódki nie puszczaly niczym Mariusz Pudzianowski malego fiata w Silaczach."), nl,
                    write("'To nie to... kiedy to bylo?' - zastanawial sie sfrustrowany kapitan."), nl,!.

wpisz_kod(_) :-     write("Nie ma tu nic co mogloby przyjac kod."), nl,!.

zobacz(szafki) :-   pozycja_gracza(pokoj),
                    write("Szafki nalezace do Janusza i Seby byly zamkniete na klucz. Zapewne kazdy z nich ma swój klucz."), nl,
                    write("[Jesli kapitan dysponuje kluczem moze skorzystac z komendy otworz(szafka_janusza) lub otworz(szafka_seby).]"), nl,!.

otworz(szafka_seby) :- pozycja_gracza(pokoj),
                    write("Szafka Seby niestety jest zamknieta i bez klucza moze byc niemozliwa do otwarcia."), nl,!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj), szafka_janusza_zamknieta,
                    przedmiot_w(klucz_do_szafki_janusza, ekwipunek),
                    write("Po krótkiej, lecz uciazliwej szamotaninie z przyrdzewialym zamkiem szafki, Bombie udalo sie otworzyc szafke podkomendnego."), nl,
                    write("Niestety potyczka poskutkowala powaznymi stratami, klucz utknal w drzwiczkach i za nic nie chce ich opuscic."), nl,
                    write("Na podloge pokoju z impetem wylecialy wedka_bez_haczyka oraz czerwona_przyneta, zielona_przyneta, niebieska_przyneta."), nl,
                    write("Niestety wedka moze byc problematyczna w uzyciu bez haczyka."), nl,
                    retract(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                    assert(przedmiot_w(wedka_bez_haczyka, pokoj)),
                    assert(przedmiot_w(czerwona_przyneta, pokoj)),
                    assert(przedmiot_w(zielona_przyneta, pokoj)),
                    assert(przedmiot_w(niebieska_przyneta, pokoj)),
                    retractall(szafka_janusza_zamknieta),!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    not(szafka_janusza_zamknieta),
                    write("Pusta szafka stoi juz otworem."), nl,!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    write("Ciezko byloby otworzyc szafke bez klucza."), nl,!.


% skrzydla

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe), chuda_ryba_niezlapana,
                write("Stary, trzymajacy sie jeszcze silnik zostal zamieszkaly przez chuda rybe. Niestety jest ona poza zasiegiem reki kapitana."), nl,
                write("Moze udaloby sie ją wypłoszyć przy użyciu mlotka?"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe),
                write("Silnik jest pusty..."),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana,
                write("Wewnatrz silnika rezyduje potezna, gruba ryba. Bomba zdecydowal sie nie ryzykowac wkladania tam reki."), nl,
                write("Moze daloby sie wywabic jakos toa rybe z tego silnika"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe),
                write("Silnik jest pusty..."),!.


% dziob

zobacz(dziob) :-
    write('Znajdujesz się na dziobie statku. Chyba powienienś znaleźć tu młotek.'), nl,
    write('W pomieszczeniu znajduje się szafa, na niej leży skrzynia, jednak nie sięgnę tak łatwo.'), nl.

przedmiot_w(skrzynia, dziob).
przedmiot_w(szafa, dziob).

zobacz(szafa) :-
    pozycja_gracza(dziob),
    drabina_w_szafie,
    assert(przedmiot_w(drabina, dziob)),
    retractall(drabina_w_szafie),
    write('Jest tu drabina.'), !.

zobacz(szafa) :-
    write('Nic tu nie ma'), !.


% przod_ogona

przedmiot_w(haczyk, przod_ogona).
przedmiot_w(szalik, tyl_ogona).
przedmiot_w(ksiazka, przod_ogona).

zobacz(przod_ogona) :-
            pozycja_gracza(przod_ogona),
            write('Twoim oczom ukazuje sie szara, lekko oświetlona, podłużna przestrzeń.'), nl,
            write('Możesz iść na tył ogona.'), nl,
            write('Możesz zobaczyć co jest na prawo lub na lewo.'), nl.

zobacz(prawo) :-
            pozycja_gracza(przod_ogona),
            write('Twoim oczom ukazał się stary brzydki kredens.
Na górze przeszklony (szklane_drzwiczki), na dole są drzwiczki do szafki (dolne_drzwiczki),
pomiędzy, na blacie leży jakaś książka.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            przedmiot_w(haczyk, przod_ogona),
            write('Ktoś wbił haczyk w ściane.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            \+przedmiot_w(haczyk, przod_ogona),
            write('Nic tu nie ma.'), nl.

% --------------- KREDENS ----------------

zobacz(szklane_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            zamkniete_szklane_drzwiczki,
            write('Ani drgną, chyba sie zacieły.'), nl.

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
            write('Nie lubie czytać.'), nl.

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
            write('Nic sie nie stało.'), nl.


% --------TYŁ OGONA-----------

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            zamknieta_skrzynka_na_narzedzia,
            write('Stoi tu niewielka skrzynka na narzędzia … albo raczej na narzędzie.
Jej rozmiar pozostawia wiele wątpliwości. Jest zamknięta na nietypową kłódkę,
są na niej trzy przyciski: <^>v chyba należy je wcisnąć w jakiejś sekwencji.
Aby wpisać hasło napisz: haslo(skrzynka, [sekwencja])'), nl,
            write('Oprócz tego moge rozejrzeć sie w prawo lub w lewo.'), nl.

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
Jeden szczegół zwraca uwage … na polu stoi sobie pies o trzech nogach.
Biedak musiał wiele przeżyć. Farba na niebie wygląda jakby była świeższa od reszty.
Ktoś chciał coś zamalować.'), nl.

zobacz(prawo) :-
            pozycja_gracza(tyl_ogona),
            \+farba_nie_zdrapana,
            write('Na ścianie wisi obraz wsi polskiej.
Jeden szczegół zwraca uwage … na polu stoi sobie pies o trzech nogach.
Biedak musiał wiele przeżyć. Na niebie jest napisane “mcsldctc” pewnie jakiś analfabeta to pisał.'), nl.


zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            przedmiot_w(szalik, tyl_ogona),
            write('W kącie leży szalik z napisem POLSKA MISTRZEM POLSKI w kolorach białym i czerwonym (szalik).'), nl.

zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            \+przedmiot_w(szalik, tyl_ogona),
            write('Nic tu nie ma.'), nl.