uzyj(skafander) :- not(w_skafandrze),
                    przedmiot_w(skafander, ekwipunek),
                    write("Wpychając się w cuchnący, starożytny już ekwipunek, zauważył, że przez lepiej wewnątrz tego złomu nie oddalać się zanadto od statku, "), nl,
                    write("bo bezpieczniej byłoby już pomylić szubienicę z bungee. Nie dość, że poruszanie się w tym żelastwie jest trudnością, "), nl,
                    write("to przez hełm absolutnie nic nie słychać i nie da się rozmawiać."),
                    assert(w_skafandrze),
                    retract(przedmiot_w(skafander, ekwipunek)).

uzyj(skafander) :- w_skafandrze,
                    not(miejsce_na_pokladzie(sluza)),
                    write("Chęć pooddychania sobie wodą kapitana została natychmiast spełniona. Po zdjęciu hełmu skafandra płuca kapitana natychmiast wypełniły się zawartością oceanu."), nl,
                    write("KONIEC GRY."), nl,
                    die.

uzyj(skafander) :- w_skafandrze,
                    przedmiot_w(chuda_ryba, ekwipunek),
                    write("Już w momencie zdejmowania hełmu Bomba zorientował się że słyszy nieznajomy głos."), nl,
                    write("„ZOSTAW MNIE TY BYDLAKU! MOJA *ZONA* CI TEGO NIE WYBACZY! Znaczy moja była *zona*… "), nl,
                    write("Marzena odeszła ode mnie już jakiś czas temu. Gruba baba…” - wykrzyczało coś piskliwym głosem."), nl,
                    write("Tytus zorientował się, że za irytujący monolog odpowiada chuda_ryba wyciągnięta z oceanu. Może rozmowa z nią da jakieś interesujące informacje."),
                    retractall(w_skafandrze),
                    assert(przedmiot_w(skafander, ekwipunek)).

uzyj(skafander) :- w_skafandrze,
                    write("Wychodzenie ze skafandra okazało się dość trudne, gdyż sprzęt chodził dość opornie."), nl,
                    write("Mimo wszystko cały wysiłek był warty uwolnienia się od tego psakudnego kostiumu. Przynajmniej teraz kapitan ma szansę coś usłyszeć"), nl,
                    retractall(w_skafandrze),
                    assert(przedmiot_w(skafander, ekwipunek)).

uzyj(haczyk) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    przedmiot_w(haczyk, ekwipunek),
                    write("Kapitan przywiązał haczyk do wędki."), nl,
                    write("[Z ekwipunku znikają wedka_bez_haczyka i haczyk, a pojawia sie wedka.]"), nl,
                    retract(przedmiot_w(wedka_bez_haczyka, ekwipunek)),
                    retract(przedmiot_w(haczyk, ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)).

uzyj(haczyk) :- przedmiot_w(haczyk, ekwipunek),
                    write("Co by zrobić z tym haczykiem? Pewnie przydałaby się jakaś wędka..."), nl.

uzyj(wedka_bez_haczyka) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    write("Wędką bez haczyka można sobie oczywiście pomachać i poudawać, że łowi się ryby, ale nie przyniesie to efektów."), nl.

uzyj(wedka) :- przedmiot_w(wedka, ekwipunek),
                    write("Do łowienia przydałaby się jeszcze przyneta"), nl.


uzyj(wedka_z_niebieska_przneta) :- pozycja_gracza(skrzydlo_prawe), not(gruba_ryba_zlapana), przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek),
                    write("Potężna wodna bestia wypłynęła z silnika i pochwyciła niebieską przynętę. Kapitan musiał się wysilić by złapać tego potwora."), nl,
                    write("[Do ekwipunku dodano gruba_ryba oraz zamieniono wedka_z_niebieska_przyneta na wedka.]"), nl,
                    assert(gruba_ryba_zlapana),
                    assert(przedmiot_w(gruba_ryba,ekwipunek)),
                    retract(przedmiot_w(wedka_z_niebieska_przneta,ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)).

uzyj(wedka_z_zielona_przneta) :- przedmiot_w(wedka_z_zielona_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę.").

uzyj(wedka_z_czerwona_przneta) :- przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę.").

uzyj(wedka_z_niebieska_przneta) :- przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę.").

uzyj(czerwona_przyneta) :- not(przedmiot_w(wedka,ekwipunek))

uzyj(zielona_przyneta) :-

uzyj(niebieska_przyneta) :- 



