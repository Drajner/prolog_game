:- dynamic klodka_zamknieta/1, skafander_zbadany/1, w_skafandrze/1.

klodka_zamknieta.

zobacz(kalendarz) :- pozycja_gracza(pokoj), 
                    write("Modelka kusi oczy kapitana. To już koncowka marca."), nl,
                    write("Dokladniej 26 marca 2039 roku. Za 2 tygodnie powinna przyjsc wypłata i znowu będzie się można napic."), nl,
                    write("Byleby nie skończyć tak jak w Nowy Rok dwa lata temu. Wtedy to była tragedia… Przez bite dwa dni Bomba był nie do życia. "), nl,
                    write("Ledwo prowadził rakietę. Nie dotarł na narodziny swojego syna, chociaż i tak by tego nie pamiętał."), nl,
                    write("Dzień po pierwszym stycznia nie zatrzymał się w jego pamięci. Aldona nadal ma mu to za złe."), nl.

zobacz(kuchnia) :-  pozycja_gracza(pokoj),
                    write("Potworny syf rzucał się w oczy. Brudne naczynia leżały wszędzie."), nl.


uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    janusz_gotuje,
                    write("Kuchnia jest zajęta przez Janusza przygotowującego ryby na dzisiejszą kolacje."), nl.

uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    write("Kapitanowi nie przystoi gotować na swoim statku, przecież ma od tego ludzi."), nl.

uzyj(kuchnia) :-    write("Nie ma tu kuchni, jeśli przez ostatnia godzine caly statek magicznie nie pozmienial swojego wyposazenia, to powinna nadal byc w pokoju."), nl.

zobacz(skafander) :- klodka_zamknieta,
                    pozycja_gracza(pokoj),
                    write("Gwiezdna Flota postanowiła wyposażyć statki „nowoczesne”, 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrała przetarg skupiła, je ze złomu i wynajęła prywaciarza, aby je połatał za półdarmo."), nl,
                    write("Gwiezdna Flota jak widać nie oszczędza na bezpieczeństwie swoich żołnierzy. Może i nie były tanie, ale za to były nędzne. Coś za coś."), nln
                    write("Miejmy nadzieję, że wyjście w tym poza statek nie będzie równało się pewnej śmierci."), nl,
                    write("Niestety skafander został zablokowany kłódką z zamkiem na 4 cyfry i przypiętą karteczką z napisem:"), nl,
                    write("„Kod to data urodzin naszego Brajanka, mam nadzieję że pamiętasz!”"), nl,
                    write("„Kurrr…” - wycedził przez zęby Bomba. - „Trudne…” -> zobacz_klodke."), nl,
                    write("[Aby podac kod do klodki, wpisz_kod(XXXX)]"), nl,
                    assert(skafander_zbadany).

zobacz(skafander) :- write("Gwiezdna Flota postanowiła wyposażyć statki „nowoczesne”, 30-letnie skafandry, UBERSPEIMACHER419."), nl,
                    write("Firma, która wygrała przetarg skupiła, je ze złomu i wynajęła prywaciarza, aby je połatał za półdarmo."), nl,
                    write("Gwiezdna Flota jak widać nie oszczędza na bezpieczeństwie swoich żołnierzy. Może i nie były tanie, ale za to były nędzne. Coś za coś."), nln
                    write("Miejmy nadzieję, że wyjście w tym poza statek nie będzie równało się pewnej śmierci."), nl,

wpisz_kod(2137) :-  klodka_zamknieta,
                    skafander_zbadany,
                    pozycja_gracza(pokoj),
                    write("„Nareszcie… 02.01.2037. Aldona nie mogłaś czegoś łatwiejszego wybrać?” - wyrzucił pod nosem Bomba otwierając zamek."), nl,
                    write("Teraz można zabrać skafander [komenda podnies]"),

                    assert(przedmiot_w(skafander, pokoj)),
                    retractall(klodka_zamknieta).

wpisz_kod(_) :-     klodka_zamknieta,
                    skafander_zbadany,
                    pozycja_gracza(pokoj),
                    write("Pałąki kłódki nie puszczały niczym Mariusz Pudzianowski małego fiata w Siłaczach."), nl,
                    write("„To nie to… kiedy to było?” - zastanawiał się sfrustrowany kapitan."), nl.

wpisz_kod(_) :-     write("Nie ma tu nic co mogłoby przyjąć kod."), nl.

zobacz(szafki) :-   pozycja_gracza(pokoj),
                    write("Szafki należące do Janusza i Seby były zamknięte na klucz. Zapewne każdy z nich ma swój klucz."), nl,
                    write("[Jeśli kapitan dysponuje kluczem może skorzystać z komendy otworz(szafka_janusza) lub otworz(szafka_seby).]"), nl.

otworz(szafka_seby) :- pozycja_gracza(pokoj),
                    write("Szafka Seby niestety jest zamknięta i bez klucza może być niemożliwa do otwarcia."), nl.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    przedmiot_w(klucz_do_szafki_janusza, ekwipunek),
                    write("Po krótkiej, lecz uciążliwej szamotaninie z przyrdzewiałym zamkiem szafki, Bombie udało się otworzyć szafkę podkomendnego."), nl,
                    write("Niestety potyczka poskutkowała poważnymi stratami, klucz utknął w drzwiczkach i za nic nie chce ich opuścić."), nl,
                    write("Na podłogę pokoju z impetem wyleciały wedka_bez_haczyka oraz zolta_przyneta, zielona_przyneta, niebieska_przyneta."), nl,
                    write("Niestety wędka może być problematyczna w użyciu bez haczyka."), nl,
                    retract(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                    assert(przedmiot_w(wedka_bez_haczyka, pokoj)),
                    assert(przedmiot_w(zolta_przyneta, pokoj)),
                    assert(przedmiot_w(zielona_przyneta, pokoj)),
                    assert(przedmiot_w(niebieska_przyneta pokoj)),
                    szafka_janusza_otwarta.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    szafka_janusza_otwarta
                    write("Pusta szafka stoi już otworem."), nl.

otworz(szafka_janusza) :- pozycja_gracza(pokoj),
                    write("Ciężko byłoby otworzyć szafkę bez klucza."), nl.





