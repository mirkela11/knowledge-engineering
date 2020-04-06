import('people.pl').
import('symptoms.pl').

% X - patient; Y - list of symptoms
% TODO: update patient stuff

% urine cytology
supplementary_test(X, urine_cytology) :- 
   non_muscle_invasive_bladder_cancer_symptom(Y),
   member(Y, X).

% cmp
supplementary_test(X, cmp) :-
   non_muscle_invasive_bladder_cancer_symptom(Y),
   member(Y, X).

% cat scan
supplementary_test(X, cat_scan) :-
   non_muscle_invasive_bladder_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, cat_scan) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, cat_scan) :-
   kidney_stones_symptom(Y),
   member(Y, X).

% cystoscopy
supplementary_test(X, cystoscopy) :-
   non_muscle_invasive_bladder_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, cystoscopy) :-
   bladder_prolapse_symptom(Y),
   member(Y, X).

supplementary_test(X, cystoscopy) :-
   prostatitis_symptom(Y),
   member(Y, X).

% rigid cystoscopy
supplementary_test(X, rigid_cystoscopy) :-
   non_muscle_invasive_bladder_cancer_symptom(Y),
   member(Y, X).

% psa
supplementary_test(X, psa) :-
   prostate_cancer_symptom(Y),
   member(Y, X).

% dre
supplementary_test(X, dre) :-
   prostate_cancer_symptom(Y),
   member(Y, X).

% kidney biopsy
supplementary_test(X, kidney_biopsy) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

% prostate biopsy
supplementary_test(X, prostate_biopsy) :-
   advanced_prostate_cancer_symptom(Y),
   member(Y, X).

% urodynamics
supplementary_test(X, urodynamics) :-
   bladder_prolapse_symptom(Y),
   member(Y, X).

supplementary_test(X, urodynamics) :-
   prostatitis_symptom(Y),
   member(Y, X).

% urinalysis
supplementary_test(X, urinalysis) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, urinalysis) :-
   urinary_tract_infections_symptom(Y),
   member(Y, X).

supplementary_test(X, urinalysis) :-
   prostatitis_symptom(Y),
   member(Y, X).

% liver function test
supplementary_test(X, liver_function_test) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

% intravenous pyelogram (IVP)
supplementary_test(X, ivp) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

% x-rays
supplementary_test(X, x_rays) :-
   bladder_prolapse_symptom(Y),
   member(Y, X).

supplementary_test(X, x_rays) :-
   kidney_stones_symptom(Y),
   member(Y, X).

% ultrasound
supplementary_test(X, ultrasound) :-
   bladder_prolapse_symptom(Y),
   member(Y, X).

supplementary_test(X, ultrasound) :-
   kidney_stones_symptom(Y),
   member(Y, X).

supplementary_test(X, ultrasound) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, ultrasound) :-
   prostatitis_symptom(Y),
   member(Y, X).

% mri
supplementary_test(X, mri) :-
   bladder_prolapse_symptom(Y),
   member(Y, X).

supplementary_test(X, mri) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

% physical exam
supplementary_test(X, physical_exam) :-
   low_testosterone_symptom(Y),
   member(Y, X).

supplementary_test(X, physical_exam) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

supplementary_test(X, physical_exam) :-
   prostatitis_symptom(Y),
   member(Y, X).

% other blood tests
supplementary_test(X, blood_test_testosterone_level) :-
   low_testosterone_symptom(Y),
   member(Y, X).

supplementary_test(X, blood_test_lh) :-
   low_testosterone_symptom(Y),
   member(Y, X).

supplementary_test(X, blood_test_prolactin_level) :-
   low_testosterone_symptom(Y),
   member(Y, X).

supplementary_test(X, blood_test_hemoglobin) :-
   low_testosterone_symptom(Y),
   member(Y, X).

supplementary_test(X, blood_test_chemistry) :-
   kidney_cancer_symptom(Y),
   member(Y, X).

