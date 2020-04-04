import('people.pl').


% pregled urologa specijaliste i ultrazvuk karlice male karlice
% Generalno se rade kao preventivni pregledi za uroloske bolesti

% PROSTATE CANCER (marker pacer, dre)
% 1 in 9 men die of it; african american man 1 in 6 (also more dangerous)
% 55+ years old greater chance
% smoking and overweight big risks
% family history 3-4X more chance to have it
% =======================================================================
preventive_examination(X, prostate_cancer) :-
    male(X),
    (
    age(X, A), A > 55;
    smoker(X, S), S = yes;
    alcoholic(X, K), K = yes;
    weight(X, W), W > 110;
    family_history(X, L), member(prostate_cancer, L);
    disease_history(X, D), member(prostate_cancer, D)
    ).

% ADVANCED PROSTATE CANCER
% same as prostate

% NON MUSCLE INVASIVE BLADDER CANCER
% more male than female patients
% danger group is caucasian men 75-84
% patients with lymphomas and leukemia have higher chance due to radiation treatment
% smoking is big risk
% workplace may cause it, where there are chemicals
% =======================================================================
preventive_examination(X, bladder_cancer) :- 
    age(X, A), A > 74,
    (
    disease_history(X, L), 
      (
      member(lekuemia, L); 
      member(lymphomas, L)
      );
    smoker(X, S), S = yes
    ).


% BLADDER PROLAPSE
% only women can get it
% then can get it from stress during birth or if they had many vaginal childbirths
% heavy lifting, chronic coughing, constipation, obesity, menopause, 
% prior pelvic surgery, aging
% =======================================================================
preventive_examination(X, bladder_prolapse) :-
    female(X),
    (
    disease_history(X, L), member(pelvic_surgery, L);
    age(X, A), A > 55;
    weight(X, W), W > 100;
    children(X, C), C > 2
    ).


% LOW TESTOSTERONE
% only men, all ages, but 80+ are risk group
% overweight, diabetis, metabolic syndrome, usage of narcotics and pain meds
% HIV and AIDS patients tend to have it, testicular cancer, chemo or radiation
% =======================================================================
preventive_examination(X, low_testosterone) :-
    male(X),
    (
    age(X, A), A > 80;
    weight(X, W), W > 110;
    disease_history(X, L),
      ( 
      member(diabetis, L); 
      member(metabolic_syndrome, L);
      member(aids, L);
      member(hiv, L);
      member(testicular_cancer, L)
      )
    ).
    
% KIDNEY CANCER
% more often men have it than women
% 45+ years old, although there is a type of this cancer that can affect chidlren
% Smoking, Obesity, Chronic high blood pressure, Misusing certain pain medicine for a long time
% Von Hippel-Lindau syndrome, Tuberous sclerosis, Family history of kidney cancer
% =======================================================================
preventive_examination(X, kidney_cancer) :-
    age(X, A) , A > 45,
    (
    smoker(X, S), S = yes;
    weight(X, W), W > 100;
    disease_history(X, L),
      ( 
      member(high_blood_pressure, L);
      member(tuberous_sclerosis, L)
      );
    family_history(X, F),
      member(kidney_cancer, F)
    ).


% KIDNEY STONES
% high salt intake, oxalate intake, (beef, fish, chicken, pork intake)
% low urine volume, OBESITY, some medication with vitamin C and calcium
% gastric bypass surgery, ulcerative colitis
% family history cystinuria, hyperoxaluria, kidney stones
% =======================================================================
preventive_examination(X, kidney_stones) :-
    weight(X, W), W > 100;
    disease_history(X, L), 
      (
      member(gastric_bypass, L);
      member(ulcerative_colitis, L)
      );
    family_history(X, F),
      (
      member(kidney_stones, F);
      member(cystinuria, F);
      member(hyperoxaluria, F)
      ).

% PROSTATITIS
% stress, nerve inflammation or irritation, prior urinary tract infections
% Pelvic floor muscle tension, Prostate stones , A urethral stricture or scar tissue
% Prostate cancer, Benign prostatic hyperplasia, bladder infection
% =======================================================================
preventive_examination(X, prostatitis) :-
    male(X),
    disease_history(X, L), 
      (
      member(urinary_tract_infection, L);
      member(prostate_stones, L);
      member(prostate_cancer, L);
      member(bladder_infection, L)
      ).

% URINARY TRACT INFECTION ( 2 types : bladder infection and kidney infection )
% 60 % woman, 12 % men have it during lifetime
% menopause can lower chance of getting it
% using birth conrol products
% abnormal anatomy, enlarged bladder, diabetis
% =======================================================================
preventive_examination(X, urinary_tract_infection) :-
    disease_history(X, L),
      (
      member(enlarged_bladder, L);
      member(diabetis, L)
      ).
