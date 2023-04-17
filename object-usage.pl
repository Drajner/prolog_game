:- dynamic was_used/1, can_be_used/1.

:- retractall(was_used(_)).

can_be_used(skrzynia_a).
can_be_used(ladder).

use(X) :- was_used(X),
        write("it has been already used").

use(X) :- not(can_be_used(X)),
        write("this item cannot be used").

use(X) :- can_be_used(X),
        assert(was_used(X)),
        write("successfully used").
