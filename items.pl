#:- dynamic w_skafandrze/1, gruba_ryba_zlapana/1.

gruba_ryba_niezlapana.
chuda_ryba_niezlapana.

uzyj(skafander) :- bez_skafandra,
                    przedmiot_w(skafander, ekwipunek),
                    write("Wpychajac sie w cuchnacy, starozytny juz ekwipunek, zauwazyl, ze przez lepiej wewnatrz tego zlomu nie oddalac sie zanadto od statku, "), nl,
                    write("bo bezpieczniej byloby juz pomylic szubienice z bungee. Nie dosc, ze poruszanie sie w tym zelastwie jest trudnoscia, "), nl,
                    write("to przez helm absolutnie nic nie slychac i nie da sie rozmawiac."),
                    retractall(bez_skafandra),
                    retract(przedmiot_w(skafander, ekwipunek)),!.

uzyj(skafander) :- not(bez_skafandra),
                    not(miejsce_na_pokladzie(sluza)),
                    write("Chec pooddychania sobie woda kapitana zostala natychmiast spelniona. Po zdjeciu helmu skafandra pluca kapitana natychmiast wypelnily sie zawartoscia oceanu."), nl,
                    write("KONIEC GRY."), nl,
                    die,!.

uzyj(skafander) :- not(bez_skafandra),
                    przedmiot_w(chuda_ryba, ekwipunek),
                    write("Juz w momencie zdejmowania helmu Bomba zorientowal sie ze slyszy nieznajomy glos."), nl,
                    write("'ZOSTAW MNIE TY BYDLAKU! MOJA *ZONA* CI TEGO NIE WYBACZY! Znaczy moja byla *zona*… "), nl,
                    write("Marzena odeszla ode mnie juz jakis czas temu. Gruba baba…' - wykrzyczalo cos piskliwym glosem."), nl,
                    write("Tytus zorientowal sie, ze za irytujacy monolog odpowiada chuda_ryba wyciagnieta z oceanu. Moze rozmowa z nia da jakies interesujace informacje."),
                    assert(bez_skafandra),
                    assert(przedmiot_w(skafander, ekwipunek)),!.

uzyj(skafander) :- not(bez_skafandra),
                    write("Wychodzenie ze skafandra okazalo sie dosc trudne, gdyz sprzet chodzil dosc opornie."), nl,
                    write("Mimo wszystko caly wysilek byl warty uwolnienia sie od tego psakudnego kostiumu. Przynajmniej teraz kapitan ma szanse cos uslyszec"), nl,
                    assert(bez_skafandra),
                    assert(przedmiot_w(skafander, ekwipunek)),!.

uzyj(haczyk) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    przedmiot_w(haczyk, ekwipunek),
                    write("Kapitan przywiazal haczyk do wedki."), nl,
                    write("[Z ekwipunku znikaja wedka_bez_haczyka i haczyk, a pojawia sie wedka.]"), nl,
                    retract(przedmiot_w(wedka_bez_haczyka, ekwipunek)),
                    retract(przedmiot_w(haczyk, ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)),!.

uzyj(haczyk) :- przedmiot_w(haczyk, ekwipunek),
                    write("Co by zrobic z tym haczykiem? Pewnie przydalaby sie jakas wedka..."), nl,!.

uzyj(wedka_bez_haczyka) :- przedmiot_w(wedka_bez_haczyka, ekwipunek),
                    write("Wedka bez haczyka mozna sobie oczywiscie pomachac i poudawac, ze lowi sie ryby, ale nie przyniesie to efektów."), nl,!.

uzyj(wedka) :- przedmiot_w(wedka, ekwipunek),
                    write("Do lowienia przydalaby sie jeszcze przyneta"), nl,!.


uzyj(wedka_z_niebieska_przyneta) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana, przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek),
                    write("Potezna wodna bestia wyplynela z silnika i pochwycila niebieska przynete. Kapitan musial sie wysilic by zlapac tego potwora."), nl,
                    write("[Do ekwipunku dodano gruba_ryba oraz zamieniono wedka_z_niebieska_przyneta na wedka.]"), nl,
                    retractall(gruba_ryba_niezlapana),
                    assert(przedmiot_w(gruba_ryba,ekwipunek)),
                    retract(przedmiot_w(wedka_z_niebieska_przyneta,ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)),!.

uzyj(wedka_z_zielona_przyneta) :- przedmiot_w(wedka_z_zielona_przyneta, ekwipunek), write("Nic nie chce chwycic za ta przynete."),!.

uzyj(wedka_z_czerwona_przyneta) :- przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek), write("Nic nie chce chwycic za ta przynete."),!.

uzyj(wedka_z_niebieska_przyneta) :- przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek), write("Nic nie chce chwycic za ta przynete."),!.

uzyj(czerwona_przyneta) :- przedmiot_w(czerwona_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak uzyc tej przynety."),!.
                            
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak uzyc tej przynety."),!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    brak_wedek,
                    write("Kapitan nie ma jak uzyc tej przynety."),!.

uzyj(czerwona_przyneta) :- przedmiot_w(czerwona_przyneta, ekwipunek),
                    write("Bomba zaklada czerwona przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_czerwona_przyneta]"),
                    assert(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),
                    usun_wedki,!.
                          
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    write("Bomba zaklada zielona przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_zielona_przyneta]"),
                    assert(przedmiot_w(wedka_z_zielona_przyneta, ekwipunek)),
                    usun_wedki,!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    write("Bomba zaklada niebieska przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_niebieska_przyneta]"),
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
                    write("Kapitan Bomba wielokrotnie uderza mlotkiem w silnik, aby wyploszyc rybe, a ta wyplywa prosto w jego rece."),
                    write("[Zdobyto chuda_ryba]"),
                    retractall(chuda_ryba_niezlapana),
                    assert(przedmiot_w(chuda_ryba)),!.

uzyj(mlotek) :- przedmiot_w(mlotek, ekwipunek),
                    write("Brak tu dobrego celu do tluczenia."),!.

