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

children(jane, 3).

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

height(albert, 191).
height(bob, 174).
height(bill, 184).
height(carl, 182).
height(charlie, 178).
height(dan, 129).
height(edward, 115).
height(john, 185).
height(alice, 121).
height(betsy, 163).
height(diana, 159).
height(jane, 175).

weight(albert, 91).
weight(bob, 116).
weight(bill, 135).
weight(carl, 76).
weight(charlie, 90).
weight(dan, 52).
weight(edward, 36).
weight(john, 88).
weight(alice, 32).
weight(betsy, 56).
weight(diana, 53).
weight(jane, 67).

family_history(albert, [bladder_prolapse]).
family_history(bob, []).
family_history(bill, [non_muscle_invasive_bladder_cancer, prostatitis]).
family_history(carl, []).
family_history(charlie, []).
family_history(dan, [bladder_cancer, kidney_stones]).
family_history(edward, [kidney_cancer]).
family_history(john, [non_muscle_invasive_bladder_cancer]).
family_history(alice, [prostate_cancer]).
family_history(betsy, [bladder_cancer]).
family_history(diana, []).
family_history(jane, [prostate_cancer, prostatitis]).

disease_history(albert, [bladder_cancer]).
disease_history(bob, [kidney_stones, kidney_cancer]).
disease_history(bill, [non_muscle_invasive_bladder_cancer]).
disease_history(carl, [kidney_stones]).
disease_history(charlie, []).
disease_history(dan, [bladder_cancer, bladder_prolapse]).
disease_history(edward, []).
disease_history(john, [bladder_cancer, prostate_cancer]).
disease_history(alice, [gastric_bypass]).
disease_history(betsy, [kidney_stones]).
disease_history(diana, [kidney_cancer, prostatitis]).
disease_history(jane, [prostate_cancer, non_muscle_invasive_bladder_cancer]).

smoker(albert, no).
smoker(bob, yes).
smoker(bill, no).
smoker(carl, no).
smoker(charlie, yes).
smoker(dan, no).
smoker(edward, no).
smoker(john, yes).
smoker(alice, no).
smoker(betsy, yes).
smoker(diana, yes).
smoker(jane, no).

alcoholic(albert, no).
alcoholic(bob, no).
alcoholic(bill, no).
alcoholic(carl, no).
alcoholic(charlie, yes).
alcoholic(dan, no).
alcoholic(edward, no).
alcoholic(john, no).
alcoholic(alice, no).
alcoholic(betsy, yes).
alcoholic(diana, no).
alcoholic(jane, no).

blood_type(albert, b_plus).
blood_type(bob, o_minus).
blood_type(bill, ab_minus).
blood_type(carl, b_minus).
blood_type(charlie, o_plus).
blood_type(dan, o_plus).
blood_type(edward, b_plus).
blood_type(john, a_minus).
blood_type(alice, a_plus).
blood_type(betsy, a_minus).
blood_type(diana, b_minus).
blood_type(jane, ab_plus).

depressive(albert, yes).
depressive(bob, no).
depressive(bill, no).
depressive(carl, no).
depressive(charlie, yes).
depressive(dan, no).
depressive(edward, no).
depressive(john, no).
depressive(alice, no).
depressive(betsy, no).
depressive(diana, yes).
depressive(jane, no).
