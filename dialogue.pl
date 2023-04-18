rozmawiaj(seba, kuchnia) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Seba, zajmij się kuchnią! Jest tam potworny syf!” - rozkazał kapitan."), nl,
                            write("„Panie kapitanie teraz jest tura Janusz, ja myłem ostatnio…” - odrzekł Seba."), nl,
                            write("„Racja, sprawiedliwość musi być”"), nl.
rozmawiaj(janusz, kuchnia) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Janusz zajmij się kuchnią! Jest tam potworny syf!” - rozkazał kapitan."), nl,
                            write("„Ale panie kapitanie, przecież i tak nie mamy już jedzenia. Prowiant nam się skończył już wczoraj, a "), nl,
                            write("jak mieliśmy zamawiać hot-dogi na stacji to zobaczyliśmy tego gnoja i musieliśmy ruszać” - odpowiedział Janusz."), nl,
                            write("„No tak, rzeczywiście.” "), nl.
rozmawiaj(seba, szafka) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Daj mi klucz do swojej szafki Seba!” - rozkazał kapitan."), nl,
                            write("„Bardzo bym chciał panie kapitanie, ale ukradli mi go tydzień temu.” - odparł Seba."), nl,
                            write("„Niech to szlag.”"), nl.
rozmawiaj(janusz, szafka) :- not(w_skafandrze), pozycja_gracza(pokoj), klucz_janusza_wydany
                            write("„Daj mi klucz do swojej szafki Janusz!” - rozkazał kapitan."), nl,
                            write("„Panie kapitanie, przed chwilą to zrobiłem. Zapomniał pan?” - odparł Janusz."), nl,
                            write("„Oczywiście że nie, sprawdzam twoją czujność.”"), nl.
rozmawiaj(janusz, szafka) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Daj mi klucz do swojej szafki Janusz!” - rozkazał kapitan."), nl,
                            write("„Oczywiście panie kapitanie. Tylko niech pan uważa, bo zamek się zacina.” - odparł Janusz."), nl,
                            write("[Do ekwipunku dodano klucz_do_szafki_janusza]"), nl,
                            assert(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                            assert(klucz_janusza_wydany).
rozmawiaj(seba, szafki) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Daj mi klucz do swojej szafki Seba!” - rozkazał kapitan."), nl,
                            write("„Bardzo bym chciał panie kapitanie, ale ukradli mi go tydzień temu.” - odparł Seba."), nl,
                            write("„Niech to szlag.”"), nl.
rozmawiaj(janusz, szafki) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Daj mi klucz do swojej szafki Janusz!” - rozkazał kapitan."), nl,
                            write("„Oczywiście panie kapitanie. Tylko niech pan uważa, bo zamek się zacina.” - odparł Janusz."), nl,
                            write("[Do ekwipunku dodano klucz_do_szafki_janusza]"), nl,
                            assert(przedmiot_w(klucz_do_szafki_janusza, ekwipunek)),
                            assert(klucz_janusza_wydany).
rozmawiaj(janusz, szafki) :- not(w_skafandrze), pozycja_gracza(pokoj), klucz_janusza_wydany
                            write("„Daj mi klucz do swojej szafki Janusz!” - rozkazał kapitan."), nl,
                            write("„Panie kapitanie, przed chwilą to zrobiłem. Zapomniał pan?” - odparł Janusz."), nl,
                            write("„Oczywiście że nie, sprawdzam twoją czujność.”"), nl.
rozmawiaj(seba, skafander) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Seba co wiesz o tym skafandrze?” - zapytał Bomba."), nl,
                            write("„Tak widziałem jak ostatnio pańska żona przy nim grzebała jak pana nie było.” - powiedział Seba."), nl,
                            write("„To nie brzmi dobrze…”"), nl.
rozmawiaj(janusz, skafander) :- not(w_skafandrze), pozycja_gracza(pokoj),
                            write("„Janusz co wiesz o tym skafandrze?” - zapytał Bomba."), nl,
                            write("„Tak naprawdę to nie wiele.” - powiedział Seba."), nl,
                            write("„Hmm…”"), nl.
rozmawiaj(janusz, chuda_ryba) :- not(w_skafandrze), pozycja_gracza(pokoj), przedmiot_w(chuda_ryba, ekwipunek)
                            write("„Janusz co możesz mi powiedzieć o tej rybie?” - zapytał Bomba."), nl,
                            write("„To bardzo ciekawy okaz. Czytałem kiedyś w czasopiśmie, że samce i samice tego gatunku bardzo się od siebie różnią."), nl,
                            write("Samce są małe, chuderlawe i pełne ości. Samice za to są grube i pełne mięsa. Taką samicą to by się człowiek najadł…"), nl,
                            write("I to nie jeden! Jakby pan jakąś znalazł, to mielibyśmy pyszną kolację."), nl,
                            write("Zakładam, że jeśli jest tu samiec to pewnie i samica by się znalazła, bo te stworzenia zazwyczaj są spotykane w parach.” - opowiadał Janusz."), nl.

rozmawiaj(janusz, wedka_bez_haczyka) :- not(w_skafandrze), pozycja_gracza(pokoj), szafka_janusza_otwarta,

rozmawiaj(janusz, przynety) :- not(w_skafandrze), pozycja_gracza(pokoj), szafka_janusza_otwarta,



rozmawiaj(janusz, gruba_ryba) :- not(w_skafandrze), pozycja_gracza(pokoj), przedmiot_w(gruba_ryba, ekwipunek), przedmiot_w(chuda_ryba, ekwipunek),
                            write("„Cóż za piękna ryba!” - odparł Janusz po wzięciu samicy do rąk. - „Od razu zabieram się do kuchni."), nl,
                            write("Jezu jaki ja jestem głodny! Niech mi pan da i tę drugą, będzie na przystawkę.”"), nl,
                            write("Kapitan przekazał żołnierzowi dwie ryby, a ten prędko przeniósł się do kuchni."), nl,
                            write("Ryby były abyt zajęte kłótnią pomiędzy sobą, żeby odnotować zmianę.")
                            write("Na siedzeniu, które do niedawna zajmował, znajdował się śrubokręt."), nl,
                            write("[Ryby zostały oddane, do ekwipunku dodano srubokret.]")
                            assert(przedmiot_w(srubokret, ekwipunek)),
                            retract(przedmiot_w(gruba_ryba, ekwipunek)),
                            retract(przedmiot_w(chuda_ryba, ekwipunek)),
                            assert(janusz_gotuje).

