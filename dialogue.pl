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
rozmawiaj(janusz, chuda_ryba) :- not(w_skafandrze), pozycja_gracza(pokoj),
rozmawiaj(janusz, przynety) :- not(w_skafandrze), pozycja_gracza(pokoj),