#:- dynamic klodka_zamknieta/1, skafander_zbadany/1, w_skafandrze/1, janusz_gotuje/1.

:- dynamic skafander_niezbadany/0.

klodka_zamknieta.
janusz_nie_gotuje.
skafander_niezbadany.
bez_skafandra.

zobacz(kalendarz) :- pozycja_gracza(pokoj), 
                    write("Modelka kusi oczy kapitana. To juz koncowka marca."), nl,
                    write("Dokladniej 26 marca 2039 roku. Za 2 tygodnie powinna przyjsc wyplata i znowu bedzie sie mozna napic."), nl,
                    write("Byleby nie skończyc tak jak w Nowy Rok dwa lata temu. Wtedy to byla tragedia… Przez bite dwa dni Bomba byl nie do zycia. "), nl,
                    write("Ledwo prowadzil rakiete. Nie dotarl na narodziny swojego syna, chociaz i tak by tego nie pamietal."), nl,
                    write("Dzień po pierwszym stycznia nie zatrzymal sie w jego pamieci. Aldona nadal ma mu to za zle."), nl,!.

zobacz(kuchnia) :- pozycja_gracza(pokoj),
                    not(janusz_nie_gotuje),
                    write("Janusz usilnie próbuje dojsc do porozumienia z otaczajacym go syfem."), nl,
                    write("Patrzac na tempo jego dzialań kapitan dochodzi do wniosku, ze chwile to potrwa zanim dostana kolacje."),!.

zobacz(kuchnia) :-  pozycja_gracza(pokoj),
                    write("Potworny syf rzucal sie w oczy. Brudne naczynia lezaly wszedzie."), nl,!.


uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    not(janusz_nie_gotuje),
                    write("Kuchnia jest zajeta przez Janusza przygotowujacego ryby na dzisiejsza kolacje."), nl,!.

uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    write("Kapitanowi nie przystoi gotowac na swoim statku, przeciez ma od tego ludzi."), nl,!.

uzyj(kuchnia) :-    write("Nie ma tu kuchni, jesli przez ostatnia godzine caly statek magicznie nie pozmienial swojego wyposazenia, to powinna nadal byc w pokoju."), nl,!.

zobacz(skafander) :- klodka_zamknieta,
                    pozycja_gracza(pokoj),
                    write("Gwiezdna Flota postanowila wyposazyc statki „nowoczesne”, 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczeństwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
                    write("Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."), nl,
                    write("Niestety skafander zostal zablokowany klódka z zamkiem na 4 cyfry i przypieta karteczka z napisem:"), nl,
                    write("„Kod to data urodzin naszego Brajanka, mam nadzieje ze pamietasz!”"), nl,
                    write("„Kurrr…” - wycedzil przez zeby Bomba. - „Trudne…” -> zobacz_klodke."), nl,
                    write("[Aby podac kod do klodki, wpisz_kod(XXXX)]"), nl,
                    retract(skafander_niezbadany),!.

zobacz(skafander) :- write("Gwiezdna Flota postanowila wyposazyc statki „nowoczesne”, 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrala przetarg skupila, je ze zlomu i wynajela prywaciarza, aby je polatal za póldarmo."), nl,
                    write("Gwiezdna Flota jak widac nie oszczedza na bezpieczeństwie swoich zolnierzy. Moze i nie byly tanie, ale za to byly nedzne. Cos za cos."), nl,
                    write("Miejmy nadzieje, ze wyjscie w tym poza statek nie bedzie równalo sie pewnej smierci."), nl,!.

wpisz_kod(2137) :-  klodka_zamknieta,
                    not(skafander_niezbadany),
                    pozycja_gracza(pokoj),
                    write("„Nareszcie… 02.01.2037. Aldona nie moglas czegos latwiejszego wybrac?” - wyrzucil pod nosem Bomba otwierajac zamek."), nl,
                    write("Teraz mozna zabrac skafander [komenda podnies]"),

                    assert(przedmiot_w(skafander, pokoj)),
                    retractall(klodka_zamknieta),!.

wpisz_kod(_) :-     klodka_zamknieta,
                    not(skafander_niezbadany),
                    pozycja_gracza(pokoj),
                    write("Palaki klódki nie puszczaly niczym Mariusz Pudzianowski malego fiata w Silaczach."), nl,
                    write("„To nie to… kiedy to bylo?” - zastanawial sie sfrustrowany kapitan."), nl,!.

wpisz_kod(_) :-     write("Nie ma tu nic co mogloby przyjac kod."), nl,!.

zobacz(szafki) :-   pozycja_gracza(pokoj),
                    write("Szafki nalezace do Janusza i Seby byly zamkniete na klucz. Zapewne kazdy z nich ma swój klucz."), nl,
                    write("[Jesli kapitan dysponuje kluczem moze skorzystac z komendy otworz(szafka_janusza) lub otworz(szafka_seby).]"), nl,!.

otworz(szafka_seby) :- pozycja_gracza(pokoj),
                    write("Szafka Seby niestety jest zamknieta i bez klucza moze byc niemozliwa do otwarcia."), nl,!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
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
                    szafka_janusza_otwarta,!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    szafka_janusza_otwarta,
                    write("Pusta szafka stoi juz otworem."), nl,!.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    write("Ciezko byloby otworzyc szafke bez klucza."), nl,!.







