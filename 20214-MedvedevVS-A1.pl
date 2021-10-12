cat(bustie).
cat(cornie).
cat(mac).

dog(flash).
dog(rover).
dog(spot).

color(bustie, brown).
color(cornie, black).
color(mac, red).
color(flash, spotted).
color(rover, red).
color(spot, white).

pedigree(X) :- owns(tom, X); owns(kate, X).

owns(tom, X) :- color(X, black); color(X, brown).
owns(kate, X) :- dog(X), not(color(X, white)), not(owns(tom, X)).
owns(alan, mac) :- not(owns(kate, bustie)), not(pedigree(spot)).

homeless(X) :-  not(owns(_, X)), (cat(X); dog(X)).

echo([]).
echo([I]) :- format('F = ~w\n', [I]), !.
echo([I|Is]) :- format('F = ~w, ', [I]), echo(Is).

main(_) :- writeln('What pets Tom and Kate own?\n'), 
	writeln('Tom own?'), 
	(findall(F, owns(tom,F), RedFs), echo(RedFs)),
	writeln('Kate own?'), 
	(findall(F1, owns(kate,F1), Red1Fs), echo(Red1Fs)).
:- initialization(main,main).