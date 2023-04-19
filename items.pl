#:- dynamic w_skafandrze/1, gruba_ryba_zlapana/1.

gruba_ryba_niezlapana.
chuda_ryba_niezlapana.

% pokoj + skrzydla

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
                    write("'ZOSTAW MNIE TY BYDLAKU! MOJA *ZONA* CI TEGO NIE WYBACZY! Znaczy moja byla *zona*... "), nl,
                    write("Marzena odeszla ode mnie juz jakis czas temu. Gruba baba...' - wykrzyczalo cos piskliwym glosem."), nl,
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
                    not(przedmiot_w(wedka,ekwipunek)),
                    write("Kapitan nie ma jak uzyc tej przynety."),!.
                            
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    not(przedmiot_w(wedka,ekwipunek)),
                    write("Kapitan nie ma jak uzyc tej przynety."),!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    not(przedmiot_w(wedka,ekwipunek)),
                    write("Kapitan nie ma jak uzyc tej przynety."),!.

uzyj(czerwona_przyneta) :- przedmiot_w(czerwona_przyneta, ekwipunek),
                    write("Bomba zaklada czerwona przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_czerwona_przyneta, aby zdjac przynete zdejmin_przynete.]"),
                    retract(przedmiot_w(wedka, ekwipunek)),
                    assert(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),!.
                          
uzyj(zielona_przyneta) :- przedmiot_w(zielona_przyneta, ekwipunek),
                    write("Bomba zaklada zielona przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_zielona_przyneta, aby zdjac przynete zdejmin_przynete.]"),
                    retract(przedmiot_w(wedka, ekwipunek)),
                    assert(przedmiot_w(wedka_z_zielona_przyneta, ekwipunek)),!.

uzyj(niebieska_przyneta) :- przedmiot_w(niebieska_przyneta, ekwipunek),
                    write("Bomba zaklada niebieska przynete na wedke"),
                    write("[Poprzednia wedka staje sie wedka_z_niebieska_przyneta, aby zdjac przynete zdejmij_przynete.]"),
                    retract(przedmiot_w(wedka, ekwipunek)),
                    assert(przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek)),!.

zdejmij_przynete :- przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek);przedmiot_w(wedka_z_zielona_przyneta, ekwipunek);przedmiot_w(wedka_z_niebieska_przyneta, ekwipunek),
                    write("Bomba zdejmuje przynete z wedki."), nl,
                    write("[Ponownie otrzymujesz wedka.]"),
                    retract(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),
                    retract(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),
                    retract(przedmiot_w(wedka_z_czerwona_przyneta, ekwipunek)),
                    assert(przedmiot_w(wedka, ekwipunek)).


uzyj(mlotek) :- przedmiot_w(mlotek,ekwipunek),
                    chuda_ryba_niezlapana,
                    pozycja_gracza(skrzydlo_lewe),
                    write("Kapitan Bomba wielokrotnie uderza mlotkiem w silnik, aby wyploszyc rybe, a ta wyplywa prosto w jego rece."),
                    write("[Zdobyto chuda_ryba]"),
                    retractall(chuda_ryba_niezlapana),
                    assert(przedmiot_w(chuda_ryba, ekwipunek)),!.

uzyj(mlotek) :- przedmiot_w(mlotek, ekwipunek),
                    write("Brak tu dobrego celu do tluczenia."),!.


uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    not(janusz_nie_gotuje),
                    write("Kuchnia jest zajeta przez Janusza przygotowujacego ryby na dzisiejsza kolacje."), nl,!.

uzyj(kuchnia) :-    pozycja_gracza(pokoj),
                    write("Kapitanowi nie przystoi gotowac na swoim statku, przeciez ma od tego ludzi."), nl,!.

uzyj(kuchnia) :-    write("Nie ma tu kuchni, jesli przez ostatnia godzine caly statek magicznie nie pozmienial swojego wyposazenia, to powinna nadal byc w pokoju."), nl,!.

% dziob

uzyj(drabina, szafa) :-
    pozycja_gracza(dziob),
    przedmiot_w(drabina, ekwipunek),
    assert(przedmiot_w(mlotek, dziob)),
    write("W skrzyni jest młotek!"), nl, !.

% przod_ogona


uzyj(szalik, kula_do_kregli) :-
            write('Można tym coś rozwalić albo zabić.'), nl,
            assert(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(przedmiot_w(kula_do_kregli, ekwipunek)),
            retract(przedmiot_w(szalik, ekwipunek)),
            write('Przedmiot kula_w_szaliku ląduje w ekwipunku.'), nl.

uzyj(kula_do_kregli, szalik) :-
            write('Można tym coś rozwalić albo zabić.'), nl,
            assert(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(przedmiot_w(kula_do_kregli, ekwipunek)),
            retract(przedmiot_w(szalik, ekwipunek)),
            write('Przedmiot kula_w_szaliku ląduje w ekwipunku.'), nl.

uzyj(kula_w_szaliku, szklane_drzwiczki) :-
            przedmiot_w(kula_w_szaliku, ekwipunek),
            retract(przedmiot_w(kula_w_szaliku, ekwipunek)),
            retract(zamkniete_szklane_drzwiczki),
            write('BAM! Otwarte.'), nl,
            write('Ktoś widocznie grał na tyle w kółko i krzyżyk.
W dodatku bardzo nieudolnie, są tam też jakieś znaki bez sensu.
Z wyjątkowymi imbecylami przyszło mi dzielić tą podróż.'), nl,
            write('< | x | o'), nl,
            write('—--------'), nl,
            write('o | o | >'), nl,
            write('—--------'), nl,
            write('^ | ^ | >'), nl.


% tyl_ogona


uzyj(haczyk, obraz) :-
            pozycja_gracza(tyl_ogona),
            przedmiot_w(haczyk, ekwipunek),
            retract(przedmiot_w(haczyk, ekwipunek)),
            retractall(farba_nie_zdrapana),
            write('Jest tu napisane “mcsldctc” pewnie jakiś analfabeta to pisał.'), nl.


