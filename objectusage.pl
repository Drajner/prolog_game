:- dynamic was_used/1,
        can_be_used/1,
        was_searched/1,
        can_be_searched/1,
        perform_action/1.

perform_action(_).

use(X) :- was_used(X),
        write("it has been already used"), nl, !.

use(X) :- not(can_be_used(X)),
        write("this item cannot be used"), nl, fail.

use(X) :- can_be_used(X),
        assert(was_used(X)),
        perform_action(X),
        write("successfully used"), nl, !.

search(X) :- was_searched(X),
        write("it has been already searched"), nl, !.

search(X) :- not(can_be_searched(X)),
        write("this item cannot be searched"), nl, fail.

search(X) :- can_be_searched(X),
        assert(was_searched(X)),
        perform_action(X),
        write("successfully searched"), nl,
        notice_objects_here, !.

