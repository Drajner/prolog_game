

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
                    write("Byleby nie skonczyc tak jak w Nowy Rok dwa lata temu. Wtedy to byla tragedia... Przez bite dwa dni Bomba byl nie do zycia. "), nl,
                    write("Ledwo prowadzil rakiete. Nie dotarl na narodziny swojego syna, chociaz i tak by tego nie pamietal."), nl,
                    write("Dzien po pierwszym stycznia nie zatrzymal sie w jego pamieci. Aldona nadal ma mu to za zle."), nl,!.

zobacz(kuchnia) :- pozycja_gracza(pokoj),
                    not(janusz_nie_gotuje),
                    write("Janusz usilnie próbuje dojsc do porozumienia z otaczajacym go syfem."), nl,
                    write("Patrzac na tempo jego dzialan kapitan dochodzi do wniosku, ze chwile to potrwa zanim dostana kolacje."),!.

zobacz(kuchnia) :-  pozycja_gracza(pokoj),
                    write("Potworny syf rzucal sie w oczy. Brudne naczynia lezaly wszedzie."), nl,!.



zobacz(skafander) :- klodka_zamknieta,
                    pozycja_gracza(pokoj),
                    write("Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczenstwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
                    write("Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."), nl,
                    write("Niestety skafander zostal zablokowany klódka z zamkiem na 4 cyfry i przypieta karteczka z napisem:"), nl,
                    write("'Kod to data urodzin naszego Brajanka, mam nadzieje ze pamietasz!'"), nl,
                    write("'Kurrr...' - wycedzil przez zeby Bomba. - 'Trudne...' -> zobacz_klodke."), nl,
                    write("[Aby podac kod do klodki, wpisz_kod(XXXX)]"), nl,
                    retract(skafander_niezbadany),!.

zobacz(skafander) :- write("Gwiezdna Flota postanowila wyposazyc statki 'nowoczesne', 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczenstwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
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
                write("Moze udaloby sie ja wyploszyc przy uzyciu mlotka?"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe),
                write("Silnik jest pusty..."),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana,
                write("Wewnatrz silnika rezyduje potezna, gruba ryba. Bomba zdecydowal sie nie ryzykowac wkladania tam reki."), nl,
                write("Moze daloby sie wywabic jakos toa rybe z tego silnika"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe),
                write("Silnik jest pusty..."),!.


% dziob

zobacz(dziob) :-
    write('Znajdujesz sie na dziobie statku. Chyba powieniens znalezc tu mlotek.'), nl,
    write('W pomieszczeniu znajduje sie szafa, na niej lezy skrzynia, jednak nie siegne tak latwo.'), nl.


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
            write('Twoim oczom ukazuje sie szara, lekko oswietlona, podluzna przestrzen.'), nl,
            write('Mozesz isc na tyl ogona.'), nl,
            write('Mozesz zobaczyc co jest na prawo lub na lewo.'), nl.

zobacz(prawo) :-
            pozycja_gracza(przod_ogona),
            write('Twoim oczom ukazal sie stary brzydki kredens.
Na górze przeszklony (szklane_drzwiczki), na dole sa drzwiczki do szafki (dolne_drzwiczki),
pomiedzy, na blacie lezy jakas ksiazka.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            przedmiot_w(haczyk, przod_ogona),
            write('Ktos wbil haczyk w sciane.'), nl.

zobacz(lewo) :-
            pozycja_gracza(przod_ogona),
            \+przedmiot_w(haczyk, przod_ogona),
            write('Nic tu nie ma.'), nl.

% --------------- KREDENS ----------------

zobacz(szklane_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            zamkniete_szklane_drzwiczki,
            write('Ani drgna, chyba sie zaciely.'), nl.

zobacz(szklane_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            write('Ktos widocznie gral na tyle w kólko i krzyzyk.
W dodatku bardzo nieudolnie, sa tam tez jakies znaki bez sensu.
Z wyjatkowymi imbecylami przyszlo mi dzielic ta podróz.'), nl,
            write('< | x | o'), nl,
            write('—--------'), nl,
            write('o | o | >'), nl,
            write('—--------'), nl,
            write('^ | ^ | >'), nl.

zobacz(ksiazka) :-
            pozycja_gracza(przod_ogona),
            write('Nie lubie czytac.'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            zamkniete_dolne_drzwiczki,
            write('Zamkniete, na klódce jest klawiatura literowa do wpisania hasla, limit to 8 znaków. (haslo(dolne_drzwiczki, [haslo]))'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            \+zamkniete_dolne_drzwiczki,
            przedmiot_w(kula_do_kregli, przod_ogona),
            write('W srodku jest kula do kregli.'), nl.

zobacz(dolne_drzwiczki) :-
            pozycja_gracza(przod_ogona),
            \+zamkniete_dolne_drzwiczki,
            \+przedmiot_w(kula_do_kregli, przod_ogona),
            write('Nic tu nie ma.'), nl.

haslo(dolne_drzwiczki, kapibara) :-
            pozycja_gracza(przod_ogona),
            retractall(zamkniete_dolne_drzwiczki),
            assert(przedmiot_w(kula_do_kregli, przod_ogona)),
            write('Klódka otwiera sie. W srodku znajduje sie kula do kregli (kula_do_kregli).'), nl.

haslo(dolne_drzwiczki, _) :-
            pozycja_gracza(przod_ogona),
            write('Nic sie nie stalo.'), nl.


% --------TYl OGONA-----------

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            zamknieta_skrzynka_na_narzedzia,
            write('Stoi tu niewielka skrzynka na narzedzia … albo raczej na narzedzie.
Jej rozmiar pozostawia wiele watpliwosci. Jest zamknieta na nietypowa klódke,
sa na niej trzy przyciski: <^>v chyba nalezy je wcisnac w jakiejs sekwencji.
Aby wpisac haslo napisz: haslo(skrzynka, [sekwencja])'), nl,
            write('Oprócz tego moge rozejrzec sie w prawo lub w lewo.'), nl.

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            \+zamknieta_skrzynka_na_narzedzia,
            przedmiot_w(klucz_francuski, tyl_ogona),
            write('W skrzynce jest klucz francuski (klucz-francuski).'), nl.

zobacz(tyl_ogona) :-
            pozycja_gracza(tyl_ogona),
            \+zamknieta_skrzynka_na_narzedzia,
            \+przedmiot_w(klucz_francuski, tyl_ogona),
            write('Juz nic tutaj nie ma.'), nl.

haslo(skrzynka, <>^^>) :-
            pozycja_gracza(tyl_ogona),
            retractall(zamknieta_skrzynka_na_narzedzia),
            assert(przedmiot_w(klucz_francuski, tyl_ogona)),
            write('Skrzynka otwarta, w srodku jest klucz francuski (klucz-_francuski).'),
            nl.

haslo(skrzynka, _) :-
            pozycja_gracza(tyl_ogona),
            zamknieta_skrzynka_na_narzedzia,
            write('Niepoprawne.'), nl.

zobacz(prawo) :-
            pozycja_gracza(tyl_ogona),
            farba_nie_zdrapana,
            write('Na scianie wisi obrazek wsi polskiej.
Jeden szczegól zwraca uwage … na polu stoi sobie pies o trzech nogach.
Biedak musial wiele przezyc. Farba na niebie wyglada jakby byla swiezsza od reszty.
Ktos chcial cos zamalowac.'), nl.

zobacz(prawo) :-
            pozycja_gracza(tyl_ogona),
            \+farba_nie_zdrapana,
            write('Na scianie wisi obraz wsi polskiej.
Jeden szczegól zwraca uwage … na polu stoi sobie pies o trzech nogach.
Biedak musial wiele przezyc. Na niebie jest napisane “mcsldctc” pewnie jakis analfabeta to pisal.'), nl.


zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            przedmiot_w(szalik, tyl_ogona),
            write('W kacie lezy szalik z napisem POLSKA MISTRZEM POLSKI w kolorach bialym i czerwonym (szalik).'), nl.

zobacz(lewo) :-
            pozycja_gracza(tyl_ogona),
            \+przedmiot_w(szalik, tyl_ogona),
            write('Nic tu nie ma.'), nl.