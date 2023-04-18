#:- dynamic w_skafandrze/1, gruba_ryba_zlapana/1.

gruba_ryba_niezlapana.
chuda_ryba_niezlapana.

uzyj(skafander) :- bez_skafandra,
                    przedmiot_w(skafander, ekwipunek),
                    write("Wpychając się w cuchnący, starożytny już ekwipunek, zauważył, że przez lepiej wewnątrz tego złomu nie oddalać się zanadto od statku, "), nl,
                    write("bo bezpieczniej byłoby już pomylić szubienicę z bungee. Nie dość, że poruszanie się w tym żelastwie jest trudnością, "), nl,
                    write("to przez hełm absolutnie nic nie słychać i nie da się rozmawiać."),
                    retractall(bez_skafandra),
                    retract(przedmiot_w(skafander, ekwipunek)),!.

uzyj(skafander) :- not(bez_skafandra),
                    not(miejsce_na_pokladzie(sluza)),
                    write("Chęć pooddychania sobie wodą kapitana została natychmiast spełniona. Po zdjęciu hełmu skafandra płuca kapitana natychmiast wypełniły się zawartością oceanu."), nl,
                    write("KONIEC GRY."), nl,
                    die,!.

uzyj(skafander) :- not(bez_skafandra),
                    przedmiot_w(chuda_ryba, ekwipunek),
                    write("Już w momencie zdejmowania hełmu Bomba zorientował się że słyszy nieznajomy głos."), nl,
                    write("„ZOSTAW MNIE TY BYDLAKU! MOJA *ZONA* CI TEGO NIE WYBACZY! Znaczy moja była *zona*… "), nl,
                    write("Marzena odeszła ode mnie już jakiś czas temu. Gruba baba…” - wykrzyczało coś piskliwym głosem."), nl,
                    write("Tytus zorientował się, że za irytujący monolog odpowiada chuda_ryba wyciągnięta z oceanu. Może rozmowa z nią da jakieś interesujące informacje."),
                    assert(bez_skafandra),
                    assert(przedmiot_w(skafander, ekwipunek)),!.

uzyj(skafander) :- not(bez_skafandra),
                    write("Wychodzenie ze skafandra okazało się dość trudne, gdyż sprzęt chodził dość opornie."), nl,
                    write("Mimo wszystko cały wysiłek był warty uwolnienia się od tego psakudnego kostiumu. Przynajmniej teraz kapitan ma szansę coś usłyszeć"), nl,
                    assert(bez_skafandra),
                    assert(przedmiot_w(skafander, ekwipunek)),!.

uzyj(haczyk) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    przedmiot_w(haczyk, ekwipunek),
                    write("Kapitan przywiązał haczyk do wędki."), nl,
                    write("[Z ekwipunku znikają wedka_bez_haczyka i haczyk, a pojawia sie wedka.]"), nl,
                    retract(przedmiot_w(wedka_bez_haczyka, ekwipunek)),
                    retract(przedmiot_w(haczyk, ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)),!.

uzyj(haczyk) :- przedmiot_w(haczyk, ekwipunek),
                    write("Co by zrobić z tym haczykiem? Pewnie przydałaby się jakaś wędka..."), nl,!.

uzyj(wedka_bez_haczyka) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    write("Wędką bez haczyka można sobie oczywiście pomachać i poudawać, że łowi się ryby, ale nie przyniesie to efektów."), nl,!.

uzyj(wedka) :- przedmiot_w(wedka, ekwipunek),
                    write("Do łowienia przydałaby się jeszcze przyneta"), nl,!.


uzyj(wedka_z_niebieska_przyneta) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana, przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek),
                    write("Potężna wodna bestia wypłynęła z silnika i pochwyciła niebieską przynętę. Kapitan musiał się wysilić by złapać tego potwora."), nl,
                    write("[Do ekwipunku dodano gruba_ryba oraz zamieniono wedka_z_niebieska_przyneta na wedka.]"), nl,
                    retractall(gruba_ryba_niezlapana),
                    assert(przedmiot_w(gruba_ryba,ekwipunek)),
                    retract(przedmiot_w(wedka_z_niebieska_przyneta,ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)),!.

uzyj(wedka_z_zielona_przyneta) :- przedmiot_w(wedka_z_zielona_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę."),!.

uzyj(wedka_z_czerwona_przyneta) :- przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę."),!.

uzyj(wedka_z_niebieska_przyneta) :- przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek), write("Nic nie chce chwycić za tą przynętę."),!.

uzyj(czerwona_przyneta) :- przedmiot_w(czerwona_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak użyć tej przynęty."),!.
                            
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak użyć tej przynęty."),!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak użyć tej przynęty."),!.

uzyj(czerwona_przyneta) :- przedmiot_w(czerwona_przyneta, ekwipunek),
                    write("Bomba zakłada czerwoną przynęte na wędkę"),
                    write("[Poprzednia wedka staje się wedka_z_czerwona_przyneta]"),
                    assert(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),
                    usun_wedki,!.
                          
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    write("Bomba zakłada zieloną przynęte na wędkę"),
                    write("[Poprzednia wedka staje się wedka_z_zielona_przyneta]"),
                    assert(przedmiot_w(wedka_z_zielona_przyneta, ekwipunek)),
                    usun_wedki,!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    write("Bomba zakłada niebieską przynęte na wędkę"),
                    write("[Poprzednia wedka staje się wedka_z_niebieska_przyneta]"),
                    assert(przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek)),
                    usun_wedki,!.

usun_wedki :-       retract(przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek)),
                    retract(przedmiot_w(wedka_z_zielona_przyneta, ekwipunek)),
                    retract(przedmiot_w(wedka_z_czerwona_przynetam, ekwipunek)),
                    retract(przedmiot_w(wedka, ekwipunek)).

brak_wedek :-       not(przedmiot_w(wedka,ekwipunek)),
                    not(przedmiot_w(wedka_z_zielona_przyneta,ekwipunek)),
                    not(przedmiot_w(wedka_z_czerwona_przyneta,ekwipunek)),
                    not(przedmiot_w(wedka_z_niebieska_przyneta,ekwipunek)).


uzyj(mlotek) :- przedmiot_w(mlotek,ekwipunek),
                    chuda_ryba_niezlapana,
                    pozycja_gracza(skrzydlo_lewe),
                    write("Kapitan Bomba wielokrotnie uderza młotkiem w silnik, aby wypłoszyć rybę, a ta wypływa prosto w jego ręce."),
                    write("[Zdobyto chuda_ryba]"),
                    retractall(chuda_ryba_niezlapana),
                    assert(przedmiot_w(chuda_ryba)),!.

uzyj(mlotek) :- przedmiot_w(mlotek, ekwipunek),
                    write("Brak tu dobrego celu do tłuczenia."),!.

