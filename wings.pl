# :- dynamic chuda_ryba_wyploszona/1.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe), chuda_ryba_niezlapana,
                write("Stary, trzymający się jeszcze silnik został zamieszkały przez chudą rybę. Niestety jest ona poza zasięgiem ręki kapitana."), nl,
                write("Może udałoby się wypłoszyć jakoś tą rybę ze środka?"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe),
                write("Silnik jest pusty..."),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana,
                write("Wewnątrz silnika rezyduje potężna, gruba ryba. Bomba zdecydował się nie ryzykować wkładania tam ręki."), nl,
                write("Może dałoby się wywabić jakoś toą rybę z tego silnika"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe),
                write("Silnik jest pusty..."),!.

