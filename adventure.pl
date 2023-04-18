/* <The name of this game>, by <your name goes here>. */

:- discontiguous i_am_at/1, 
    przedmiot_w/2,
    at/2,
    perform_action/1,
    describe/1,
    path/3,
    use/1,
    notice_objects_here/0,
    holding/1,
    can_be_used/1,
    can_be_searched/1,
    poloz_przedmiot_na/2,
    nie_da_sie_podniesc/1,
    pozycja_gracza/1,
    zobacz/1,
    haslo/2,
    uzyj/2,
    miejsce_na_pokladzie/1,
    search/1.

:- dynamic i_am_at/1, at/2, holding/1, pozycja_gracza/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

:- include('main').
:- include('head').
:- include('object-usage').
:- include('tail').
:- include('map').
:- include('inventory').

pozycja_gracza(sterownia).


/* These rules describe how to pick up an object. */

take(X) :-
        holding(X),
        write('You''re already holding it!'),
        !, nl.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(holding(X)),
        write('OK.'),
        !, nl.

take(_) :-
        write('I don''t see it here.'),
        nl.


/* These rules describe how to put down an object. */

drop(X) :-
        holding(X),
        i_am_at(Place),
        retract(holding(X)),
        assert(at(X, Place)),
        write('OK.'),
        !, nl.

drop(_) :-
        write('You aren''t holding it!'),
        nl.


/* These rules define the direction letters as calls to go/1. */

head :- idz(head).
main :- idz(main).
tail :- idz(tail).

dziob :- idz(dziob).
sterowsnia :-

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('You can''t go that way.').


/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.

notice_objects_here :-
        i_am_at(Place),
        notice_objects_at(Place),
        nl.


/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).


/* This rule tells how to die. */

die :-
        finish.


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('The game is over. Please enter the "halt." command.'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.               -- to start the game.'), nl,
        write('head. tail. middle.  -- to go in that direction.'), nl,
        write('take(Object).        -- to pick up an object.'), nl,
        write('drop(Object).        -- to put down an object.'), nl,
        write('use(Object).         -- to use an object'), nl,
        write('search(Object).      -- to search an object'), nl,
        write('uzyj_przedmiotu_na(Obiekt, Przedmiot) --uzyj trzymanego przedmiotu na obiekcie'), nl,
        write('look.                -- to look around you again.'), nl,
        write('instructions.        -- to see this message again.'), nl,
        write('halt.                -- to end the game and quit.'), nl,
        nl.


/* This rule prints out instructions and tells where you are. */

start :-
        instructions,
        look.
