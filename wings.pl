# :- dynamic chuda_ryba_wyploszona/1.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe), chuda_ryba_niezlapana,
                write("Stary, trzymajacy sie jeszcze silnik zostal zamieszkaly przez chuda rybe. Niestety jest ona poza zasiegiem reki kapitana."), nl,
                write("Moze udaloby sie wyploszyc jakos ta rybe ze srodka?"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_lewe),
                write("Silnik jest pusty..."),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe), gruba_ryba_niezlapana,
                write("Wewnatrz silnika rezyduje potezna, gruba ryba. Bomba zdecydowal sie nie ryzykowac wkladania tam reki."), nl,
                write("Moze daloby sie wywabic jakos toa rybe z tego silnika"),!.

zobacz(silnik) :- pozycja_gracza(skrzydlo_prawe),
                write("Silnik jest pusty..."),!.

