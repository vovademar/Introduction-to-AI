item(brand, model, type, year).
item("Toyota", "Camry", "Sedan", 1982).
item("Mitsubishi", "L200", "Pickup", 1978).
item("BMW", "X7", "SUV", 2019).
item("Toyota", "Land Cruiser 300", "SUV", 2021).
item("Mercedes-Benz", "CLA", "Coupe", 2012).
item("Mercedes-Benz", "S-class", "Sedan" , 1954).
item("Mitsubishi", "Lancer", "Cedan", 1973).
item("BMW", "M8 Cabrio", "Cabriolet", 2019).
item("Mercedes-Benz", "SLC-Class", "Cabriolet", 2016).
item("Mercedes-Benz", "G-Class", "SUV", 1979).
item("Toyota", "Prius", "Hatchback", 1997).
item("BMW", "Series 5", "Sedan", 1972).
item("Mitsubishi", "Outlander", "SUV", 2001).
item("Mercedes-Benz", "AMG-GT", "Coupe", 2014).
item("Toyota", "Mark 2", "Sedan", 1968).
item("Toyota", "Supra", "Liftback", 1978).
item("Mitsubishi", "Eclipse", "Coupe", 1989).
item("BMW", "M4", "Coupe", 2014).
item("Toyota", "RAV4", "SUV", 1994).
item("Mercedes-Benz", "GLS", "SUV", 2019).
item("Mercedes-Benz", "E-Class", "Sedan", 1993).
item("Toyota", "Crown","Sedan", 1955).
item("Toyota", "Chaser", "Sedan", 1977).
item("Mercedes-Benz", "CLS", "Coupe", 2004).
item("BMW", "Series 3", "Sedan", 1975).

greetings :- 
writeln("Do you want to search something (yes/no)?"), 
read_string(user_input, "\n", "", _, Text),
	next_step(Text).

next_step(P) :- 
	P == "yes" -> chooseparameter; P == "no" -> writeln(":("), halt; writeln("Please type yes or no"), greetings.

chooseparameter:-
writeln("Choose one of the parameter to search by:"),
writeln("1 - Brand"),
writeln("2 - Model"),
writeln("3 - Body type"),
writeln("4 - Year of release"),
read_string(user_input, "\n", "", _, Val),
atom_number(Val, Num),
	searchbyparameter(Num), nl.

searchbyparameter(1) :- 
writeln("You have chosen to search by the car brand"),
writeln("You can look cars this brands: BMW, Mercedes-Benz, Mitsubishi, Toyota"),
writeln("Please enter the brand of car:"),
read_string(user_input, "\n", "", _, Brand),
	brandfind(Brand), nl.

searchbyparameter(2) :- 
writeln("You have chosen to search by the model of the car brand"),
writeln("Please enter model:"),
read_string(user_input, "\n", "", _, Model),
	modelfind(Model), nl.

searchbyparameter(3) :- 
writeln("You have chosen to search by the car body type"),
writeln("You can choose from: Sedan, Pickup, SUV, cabriolet, Coupe, Liftback, Hatchback"),
writeln("Please enter the body type of a car:"),
read_string(user_input, "\n", "", _, Type),
	typefind(Type), nl.

searchbyparameter(4) :- 
writeln("You have chosen to search by the Year"),
writeln("Please enter the lower bound(1954):"),
read_string(user_input, "\n", "", _, LYear),
writeln("Please enter the upper bound(2021)"),
read_string(user_input, "\n", "", _, UYear),
	yearfind(LYear, UYear), nl.

searchbyparameter(_) :- writeln("Please, choose from 1-4"), chooseparameter.

brandfind(Brand) :- \+ item(Brand, _, _, _), !, writeln("whoops nothing found..."), greetings.
brandfind(Brand) :- 
item(Brand, P1, P2, P3),
writeln("We have following cars: "),
writeln("========================="),
write("Brand: "), 
writeln(Brand),
write("Model: "), 
writeln(P1),
write("Body type: "), 
writeln(P2),
write("Year: "), 
writeln(P3),
writeln("========================="),
fail;greetings.

modelfind(Model) :- \+ item(_, Model, _, _), !, writeln("whoops nothing found..."), greetings.
modelfind(Model) :- 
item(P1, Model, P2, P3),
writeln("We have following cars: "),
writeln("========================="),
write("Brand: "), 
writeln(P1),
write("Model: "), 
writeln(Model),
write("Body type: "), 
writeln(P2),
write("Year: "), 
writeln(P3),
writeln("========================="),
fail;greetings.

typefind(Type) :- \+ item(_, _, Type, _), !, writeln("whoops nothing found..."), greetings.
typefind(Type) :- 
item(P1, P2, Type, P3),
writeln("We have following cars: "),
writeln("========================="),
write("Brand: "), 
writeln(P1),
write("Model: "), 
writeln(P2),
write("Body type: "), 
writeln(Type),
write("Year: "), 
writeln(P3),
writeln("========================="),
fail;greetings.

yearfind(LYear, UYear):-
atom_number(LYear, NumL),
atom_number(UYear, NumR),
	searchwithyear(NumL, NumR).
yearfind(LYear, UYear):-
\+atom_number(LYear, _),
atom_number(UYear, NumR),
	searchwithyear(1954, NumR).
yearfind(LYear, UYear):-
atom_number(LYear, NumL),
\+atom_number(UYear, _),
	searchwithyear(NumL, 2021).
yearfind(LYear, UYear):-
\+atom_number(LYear, _),
\+atom_number(UYear, _),
    searchwithyear(1954, 2021).

searchwithyear(LYear, UYear):-
between(LYear, UYear, Year),
item(Par1, Par2, Par3, Year),
writeln("========================="),
write("Name: "), writeln(Par1),
write("Studio: "), writeln(Par2),
write("Genre: "), writeln(Par3),
write("Year: "), writeln(Year),
writeln("========================="),
fail;greetings.

:- initialization writeln("Welcome! You are in the car catalog!"), (greetings, main).