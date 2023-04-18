rozmawiaj(_, _):- not(bez_skafandra),
                            write("Niestety nawet najciezsze bluzgi nie sa w stanie przebic sie przez skafander, wiec próby komunikacji w skafandrze sa skazane na porazke."), nl,!.
                            


rozmawiaj(seba, kuchnia) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Seba, zajmij sie kuchnia! Jest tam potworny syf!' - rozkazal kapitan."), nl,
                            write("'Panie kapitanie teraz jest tura Janusz, ja mylem ostatnio...' - odrzekl Seba."), nl,
                            write("'Racja, sprawiedliwosc musi byc'"), nl,!.
rozmawiaj(janusz, kuchnia) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Janusz zajmij sie kuchnia! Jest tam potworny syf!' - rozkazal kapitan."), nl,
                            write("'Ale panie kapitanie, przeciez i tak nie mamy juz jedzenia. Prowiant nam sie skończyl juz wczoraj, a "), nl,
                            write("jak mielismy zamawiac hot-dogi na stacji to zobaczylismy tego gnoja i musielismy ruszac' - odpowiedzial Janusz."), nl,
                            write("'No tak, rzeczywiscie.' "), nl,!.
rozmawiaj(seba, szafka) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Daj mi klucz do swojej szafki Seba!' - rozkazal kapitan."), nl,
                            write("'Bardzo bym chcial panie kapitanie, ale ukradli mi go tydzień temu.' - odparl Seba."), nl,
                            write("'Niech to szlag.'"), nl,!.
rozmawiaj(janusz, szafka) :- bez_skafandra, pozycja_gracza(pokoj), klucz_janusza_wydany,
                            write("'Daj mi klucz do swojej szafki Janusz!' - rozkazal kapitan."), nl,
                            write("'Panie kapitanie, przed chwila to zrobilem. Zapomnial pan?' - odparl Janusz."), nl,
                            write("'Oczywiscie ze nie, sprawdzam twoja czujnosc.'"), nl,!.
rozmawiaj(janusz, szafka) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Daj mi klucz do swojej szafki Janusz!' - rozkazal kapitan."), nl,
                            write("'Oczywiscie panie kapitanie. Tylko niech pan uwaza, bo zamek sie zacina.' - odparl Janusz."), nl,
                            write("[Do ekwipunku dodano klucz_do_szafki_janusza]"), nl,
                            assert(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                            assert(klucz_janusza_wydany),!.
rozmawiaj(seba, szafki) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Daj mi klucz do swojej szafki Seba!' - rozkazal kapitan."), nl,
                            write("'Bardzo bym chcial panie kapitanie, ale ukradli mi go tydzień temu.' - odparl Seba."), nl,
                            write("'Niech to szlag.'"), nl,!.
rozmawiaj(janusz, szafki) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Daj mi klucz do swojej szafki Janusz!' - rozkazal kapitan."), nl,
                            write("'Oczywiscie panie kapitanie. Tylko niech pan uwaza, bo zamek sie zacina.' - odparl Janusz."), nl,
                            write("[Do ekwipunku dodano klucz_do_szafki_janusza]"), nl,
                            assert(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                            assert(klucz_janusza_wydany),!.
rozmawiaj(janusz, szafki) :- bez_skafandra, pozycja_gracza(pokoj), klucz_janusza_wydany,
                            write("'Daj mi klucz do swojej szafki Janusz!' - rozkazal kapitan."), nl,
                            write("'Panie kapitanie, przed chwila to zrobilem. Zapomnial pan?' - odparl Janusz."), nl,
                            write("'Oczywiscie ze nie, sprawdzam twoja czujnosc.'"), nl,!.
rozmawiaj(seba, skafander) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Seba co wiesz o tym skafandrze?' - zapytal Bomba."), nl,
                            write("'Tak widzialem jak ostatnio pańska zona przy nim grzebala jak pana nie bylo.' - powiedzial Seba."), nl,
                            write("'To nie brzmi dobrze...'"), nl,!.
rozmawiaj(janusz, skafander) :- bez_skafandra, pozycja_gracza(pokoj),
                            write("'Janusz co wiesz o tym skafandrze?' - zapytal Bomba."), nl,
                            write("'Tak naprawde to nie wiele.' - powiedzial Seba."), nl,
                            write("'Hmm...'"), nl,!.
rozmawiaj(janusz, chuda_ryba) :- bez_skafandra, pozycja_gracza(pokoj), przedmiot_w(chuda_ryba, ekwipunek),
                            write("'Janusz co mozesz mi powiedziec o tej rybie?' - zapytal Bomba."), nl,
                            write("'To bardzo ciekawy okaz. Czytalem kiedys w czasopismie, ze samce i samice tego gatunku bardzo sie od siebie róznia."), nl,
                            write("Samce sa male, chuderlawe i pelne osci. Samice za to sa grube i pelne miesa. Taka samica to by sie czlowiek najadl..."), nl,
                            write("I to nie jeden! Jakby pan jakas znalazl, to mielibysmy pyszna kolacje."), nl,
                            write("Zakladam, ze jesli jest tu samiec to pewnie i samica by sie znalazla, bo te stworzenia zazwyczaj sa spotykane w parach.' - opowiadal Janusz."), nl,!.

rozmawiaj(janusz, wedka_bez_haczyka) :- bez_skafandra, pozycja_gracza(pokoj), not(szafka_janusza_zamknięta),
                            write("'Janusz, gdzie do cholery jest haczyk?' - spytal kapitan."), nl,
                            write("'To, panie kapitanie, jest dobre pytanie. Wiem, ze pakowalem go na statek, wiec powinien gdzies byc.' - odrzekl Janusz."), nl,
                            write("'No zobaczymy.'"), nl,!.

rozmawiaj(janusz, przynety) :- bez_skafandra, pozycja_gracza(pokoj), not(szafka_janusza_zamknięta),
                            write("'Janusz, oswiec mnie, co to za przynety?' - zapytal Bomba."), nl,
                            write("'Panie Kapitanie, czerwona to kawalek miesa, zielona to zmielone robaki, a niebieska to kosmiczny ziemniak. Mam nadzieje, ze to w czyms pomoze...' - odrzekl Janusz."), nl,!.

rozmawiaj(janusz, wedka) :- bez_skafandra, pozycja_gracza(pokoj), przedmiot_w(wedka, ekwipunek),
                            write("'Panie kapitanie, ta wedka to istny cud techniki, mozna nia lowic nawet pod woda!' - zareklamowal Janusz."), nl,
                            write("'Bardzo mnie to cieszy' - powiedzial Bomba, bez wyraznej radosci w glosie."), nl,!.

rozmawiaj(janusz, gruba_ryba) :- bez_skafandra, pozycja_gracza(pokoj), przedmiot_w(gruba_ryba, ekwipunek), przedmiot_w(chuda_ryba, ekwipunek),
                            write("'Cóz za piekna ryba!' - odparl Janusz po wzieciu samicy do rak. - 'Od razu zabieram sie do kuchni."), nl,
                            write("Jezu jaki ja jestem glodny! Niech mi pan da i te druga, bedzie na przystawke.'"), nl,
                            write("Kapitan przekazal zolnierzowi dwie ryby, a ten predko przeniósl sie do kuchni."), nl,
                            write("Ryby byly abyt zajete klótnia pomiedzy soba, zeby odnotowac zmiane."), nl,
                            write("Na siedzeniu, które do niedawna zajmowal, znajdowal sie srubokret."), nl,
                            write("[Ryby zostaly oddane, do ekwipunku dodano srubokret.]"),
                            assert(przedmiot_w(srubokret, ekwipunek)),
                            retract(przedmiot_w(gruba_ryba, ekwipunek)),
                            retract(przedmiot_w(chuda_ryba, ekwipunek)),
                            retract(janusz_nie_gotuje),!.


rozmawiaj(gruba_ryba, _) :- bez_skafandra, przedmiot_w(gruba_ryba,ekwipunek),
                            write("Niestety dzwieki opuszczajace otwór gebowy grubej ryby nie sa zrozumiale dla kapitana Bomby. Szczególnie na trzezwo."), nl,!.

rozmawiaj(chuda_ryba, zona) :- bez_skafandra, przedmiot_w(chuda_ryba,ekwipunek),
                            write("'Kim jest twoja zona?' - zapytal Bomba nie wiedzac na co sie pisze."), nl,
                            write("'Ahh Marzena... Moja byla zona... Poznalismy sie na dyskotece 10 lat temu. Wtedy jeszcze nie byla tak potwornie gruba. "), nl,
                            write("Co prawda juz wtedy byla wredna, ale mi to nie przeszkadzalo. Bylem wtedy glupi. Teraz nadal jestem, ale mniejsza o to. "), nl,
                            write("Po roku wzielismy slub i zamieszkalismy razem. Wiedlismy srednio szczesliwe zycie, az do tego roku. "), nl,
                            write("Niestety nasze *mieszkanie* zostalo zniszczone przez wieloryba i musielismy uciekac. Wtedy zaczely sie problemy. "), nl,
                            write("Marzena uznala, ze jestem nieudacznikiem zyciowym i ze odchodzi. Kiedy mi to mówila, spadlo tu to wspaniale *mieszkanie*. "), nl,
                            write("Z braku innych lokali zdecydowalismy sie tu zamieszkac.  Ja po lewej, ona po prawej.' - paplala ryba."), nl,!.

rozmawiaj(chuda_ryba, mieszkanie) :- bez_skafandra, przedmiot_w(chuda_ryba,ekwipunek),
                            write("'To mieszkanie to silniki mojego statku. Macie je natychmiast opuscic!' - huknal kapitan."), nl,
                            write("'NIE LICZ NA TO PODlA GNIDO!' - krzyczalo stworzenie - 'Moja zona nigdy nie opusci drugiego mieszkania. Jest na to zbyt leniwa."), nl,
                            write("Tylko jedzenie moze ja zmusic do ruszenia sie z domu. Kiedys raz na ruski rok udawalo mi sie ja wyciagnac z domu, "), nl,
                            write("ale od czasu separacji nic jej nie ruszy. Tak, separacja, tak to nazywa. Chociaz dla mnie móglby to byc zwyczajny rozwód. Mam juz jej dosc. Jest prawie jak moja *matka*.'"), nl,!.

rozmaiwaj(chuda_ryba, matka) :- bez_skafandra, przedmiot_w(chuda_ryba,ekwipunek),
                            write("'Dlaczego jest jak twoja matka?' - zabrnal dalej zirytowany juz Bomba."), nl,
                            write("'Obie sa grube i leniwe. Tylko by zarly... i to ciagle i ciagle. Na dodatek wybredne sa, byle czego nie zjedza. Warzywa - zle, owoce - zle, mieso - zle."), nl,
                            write("Tylko wiecznie te robaki i robaki. Ile mozna zrec robactwo? Przeciez tak nie da sie zyc!.'"), nl,
                            write("'Czyli na robaki necic...' - wyrzucil pod nosem Tytus."), nl,!.

rozmawiaj(chuda_ryba, _) :- bez_skafandra, przedmiot_w(chuda_ryba,ekwipunek),
                            write("'ZOSTAW MNIE TY BYDLAKU! MOJA *ZONA* CI TEGO NIE WYBACZY! Znaczy moja byla *zona*... "), nl,
                            write("Marzena odeszla ode mnie juz jakis czas temu. Gruba baba...' - darla sie ryba, bez uwagi na to co mówil kapitan."), nl,!.




