uzyj(skafander) :- not(w_skafandrze),
                    przedmiot_w(skafander, ekwipunek),
                    write("Wpychając się w cuchnący, starożytny już ekwipunek, zauważył, że przez lepiej wewnątrz tego złomu nie oddalać się zanadto od statku, "), nl,
                    write("bo bezpieczniej byłoby już pomylić szubienicę z bungee. Nie dość, że poruszanie się w tym żelastwie jest trudnością, "), nl,
                    write("to przez hełm absolutnie nic nie słychać i nie da się rozmawiać."),
                    assert(w_skafandrze),
                    retract(przedmiot_w(skafander, ekwipunek)).

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
                    write("Generalnie to chyba do łowienia przydałaby się jeszcze przyneta"), nl.



