male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).
male(john).

female(alice).
female(betsy).
female(diana).
female(jane).

person(X) :- male(X).
person(X) :- female(X).

age(albert,22).
age(bob,32).
age(bill,20).
age(carl,18).
age(charlie,90).
age(dan,12).
age(edward,5).
age(john,48).
age(alice,7).
age(betsy,56).
age(diana,15).
age(jane,33).

child(X) :- 
    age(X,Y),
    Y=<12.
adolescent(X) :- 
    age(X,Y),
    Y=<19,
    Y>=13.
adult(X) :- 
    age(X,Y), 
    Y<55, Y>=20.
elder(X) :- 
    age(X,Y), 
    Y>=55.
