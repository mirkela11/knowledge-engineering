% pain
symptom(pain_pelvis, [0, 1, 3, 7]).
symptom(pain_lower_abdomen, [2, 5, 6, 7]).
symptom(pain_bone, [0, 1]).
symptom(pain_back, [1, 2, 5, 6]).
symptom(painful_ejaculation, [0, 8]).
symptom(pain_or_burning_while_urinating, [0, 2, 6, 7, 8]).
symptom(pain_in_vagina, [3]).
symptom(pain_groin, [3, 6]).
symptom(pain_lower_back, [3, 7]).
symptom(pain_upper_back, [7]).
symptom(heaviness_or_pressure_vaginal_area, [3]).
symptom(painful_sex, [3]).
symptom(pain_side, [5, 6, 7]).
symptom(pain_penis_tip, [6]).
symptom(pain_bladder, [8]).
symptom(pain_testicles, [8]).
symptom(pain_penis, [8]).

% urine
symptom(frequent_urinating, [0, 3, 6, 7, 8]).
symptom(trouble_urinating, [0, 1, 2, 8]).
symptom(urgent_urinating, [2, 3, 6, 7]).
symptom(weak_urine_flow, [0, 7]).
symptom(blood_in_urine, [0, 1, 2, 5, 6]).
symptom(urinary_incontinence, [3, 7]).
symptom(not_feeling_relief_after_voiding, [3]).
symptom(urine_smells_bad, [7]).
symptom(urine_cloudy, [7]).

% sex
symptom(reduced_sex_drive, [4]).
symptom(reduced_erectile_function, [4]).

% other
symptom(tissue_out_of_vagina_tender_or_bleeding, [3]).
symptom(loss_of_appetite, [0, 1]).
symptom(loss_of_weight, [0, 1, 5]).
symptom(loss_of_body_hair, [4]).
symptom(less_beard_growtg, [4]).
symptom(loss_of_lean_muscle_mass, [4]).
symptom(tiredness, [1, 4, 5]).
symptom(weakness, [1]).
symptom(shortness_of_breath, [1]).
symptom(obesity, [4]).
symptom(depression, [4]).
symptom(lump_in_abdomen, [5]).
symptom(anemia, [5]).
symptom(nausea, [6, 7]).
symptom(vomiting, [6, 7]).
symptom(fever, [7, 8]).
symptom(chills, [8]).

% symptom groups
prostate_cancer_symptom(X) :- 
   symptom(X, Y), 
   member(0, Y).

advanced_prostate_cancer_symptom(X) :- 
   symptom(X, Y), 
   member(1, Y).

non_muscle_invasive_bladder_cancer_symptom(X) :-
   symptom(X, Y),
   member(2, Y).

bladder_prolapse_symptom(X) :-
   symptom(X, Y),
   member(3, Y).

low_testosterone_symptom(X) :-
   symptom(X, Y),
   member(4, Y).

kidney_cancer_symptom(X) :-
   symptom(X, Y),
   member(5, Y).

kidney_stones_symptom(X) :-
   symptom(X, Y),
   member(6, Y).

urinary_tract_infections_symptom(X) :-
   symptom(X, Y),
   member(7, Y).

prostatitis_symptom(X) :-
   symptom(X, Y),
   member(8, Y).
