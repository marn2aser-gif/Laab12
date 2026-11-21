
% City Connections

road('Makkah', 'Madinah').
road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').
road('Makkah', 'Riyadh').
road('Tabuk', 'Taif').
road('Taif', 'Tabuk').
road('Taif', 'Dammam').
road('Riyadh', 'Dammam').
road('Dammam', 'Riyadh').
road('Dammam', 'AlQatif').
road('AlQatif', 'Dammam').
road('AlQatif', 'Madinah').

travel(Start, End, Route) :-
    find_route(Start, End, [Start], Route).

find_route(City, City, _, [City]).

find_route(Current, Destination, Visited,
           [Current|Rest]) :-
    road(Current, Next),
    \+ memberchk(Next, Visited),
    find_route(Next, Destination,
               [Next|Visited], Rest).
