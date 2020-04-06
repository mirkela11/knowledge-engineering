% ============================= cinjenice ========================================
% psa test moze imati visoke vrijednosti psa ili niske, ali nema univerzalne tabele
% rezultatu dre testa su od doktora, ako ima nabubrina ili tvrdoce

psa_test(john, high). 
dre_test(john, good).
biopsy(john, prostate_cancer, 9).


% cystoscopic_examination - uroloski pregled/ good/bad za sad
% ultrasound je abdomena, CT ili MR karlice
% opciono RTG pluca

urology_examination(john, good).
urology_examination(betsy, bad).

ultrasound(john, good).
ultrasound(betsy, bad).

biopsy(john, bladder_cancer, 5).
biopsy(betsy, bladder_cancer, 1).

% slicni su pregledi kao i za mokracni
% ultrasound abdomena, MR ili CT grudnog kosa
ct_scan(john, good).
ct_scan(edward, bad).

mr_scan(john, good).
mr_scan(bob, good).

biopsy(john, kindey_cancer, 5).

urine_cytology(john, good).
urine_cytology(albert, good).

urin_sample(john, good).
urin_sample(albert, bad).

testosterone_level(john, good).
testosterone_level(bob, good).

x_rays(edward, good).
x_rays(john, bad).

gleason_score(john, 6).
gleason_score(betsy, 9).
gleason_score(edward, 5).
gleason_score(bob, 2).
gleason_score(albert, 7).

% ============================ dijagnoze/pravila ===================================

% PROSTATE CANCER
% povecana tjelesna masa, pojacano uzimanje masnoca
% pojacan nagon i ucestalo mokrenje, nocno mokrenje, krv u mokraci, promjena stolice
% ako ima neki od gore navedenih simptoma rade se PSA I DRE testovi
% na osnovu njih je dodatno moguce raditi Biopsiju
% dodatno ultrazvuk abdomena
% dijagnoza se radi na osnovu rezultata psa i dre (sam dre nije dovoljan) ili biopsije
% ==================================================================================
diagnosis(X, prostate_cancer) :- 
    psa_test(X, P), P = high;
    dre_test(X, D), D = bad;
    biopsy(X, prostate_cancer, B), B > 7.

% BLADDER CANCER
% pojave krvi u mokraci je rani simpotm onda uraditi:
% lab pregledi:
%   - krvna slika
%   - urea
%   - kreatinin
%   - urin
%   - urinokultura
% pregled urologa - cistoskopski pregled
% dijagnosticki imidzing 0 ultrazvuk abdomena
% biopsija?
% ==================================================================
diagnosis(X, bladder_cancer) :-
    urology_examination(X, U), U = bad;
    ultrasound(X, Us), Us = bad;
    biopsy(X, bladder_cancer, B), B > 7.

% KIDNEY CANCER
% hematurija, povremeni bol, palpabilna masas u projekciji bubrega..
% kod ovih simpotma rade se:
%   - lab pregledi..
%   - pregled urologa
%   - dijagnosticki imidzing - ct i mr abdomena
% ===================================================================
diagnosis(X, kidney_cancer) :-
    urology_examination(X, U), U = bad;
    ultrasound(X, Us), Us = bad;
    biopsy(X, kidney_cancer, B), B > 7.

% ADVANCED PROSTATE CANCER
% ususally spreds from prostate to other organs so its hard to diagnose it
% biopsy is used to dertermine it, also comes with other tumors
% ===================================================================
diagnosis(X, adv_prostate_cancer) :- 
    biopsy(X, adv_prostate_cancer, B), B > 7.

% PROSTATITIS
% Questionnaire to determine what kind of prostatitis it is
% also:
%   - DRE
%   - tests: ultrasound, prostate, urine fluid tests, blood tests
%   - PSA if there is a risk of cancer
%   - cystoscopy exam (urologist exam)
%   - urodynamics 
% ===================================================================
diagnosis(X, prostatitis) :-
    dre_test(X, D), D = bad,
    ultrasound(X, U), U = bad.

% URINARY TRACT INFECTIONS
% tests:
%   - urin smaples
%   - urin culture (optional)
%   - blood in urine (optional)
% if therapy does not help, ultrasound, ct needed for more checks
% ===================================================================
diagnosis(X, urinary_tract_infections) :-
    urin_sample(X, U), U = bad.

% HEMATURIA
% found in urin under microscope
% first sign of other diseases
% ===================================================================

% LOW TESTOSTERONE
% signs:
%   - total blood testosterone level
%   - helath history
%       = headache
%       = puberty developement
%       = head trauma
%       = head surgeries
%       = ansomnia
%       = infections in testicles
%       = injury in testicles
%       = mumps after puberty
%       = anabolic steroids usage
%       = opisats usage
%       = chemo
%       = family histor
%       = anemia or hart attacks history
%   - physical exam
% tests: 
%   - testosterone level
%   - lutenizing hormon
%   - blood prolactin level
%   - blood hemoglobin level
%   - optionals
% ===================================================================
diagnosis(X, low_testosterone) :-
    testosterone_level(X, T), T = bad,
    health_history(X, low_testosterone).


% KIDNEY STONES
% tests:
%   - X-rays
%   - ultrasound/ct scan (when blood in urine) tells us where it is and how bit it is
%   - CT scan is used in ER - fast results
% ===================================================================
diagnosis(X, kidney_stones) :-
    x_rays(X, kidney_stones);
    ct_scan(X, kidney_stones).


% BLADDER PROLAPSE
% only women can have it
% can be found with dinical history and pelvic exam
% other exams(cystoscopy, urodynamics, x-rays, ultrasound, mri)
% ==============================================================================
diganosis(X, bladder_prolapse) :-
    pelvic_exam(X, P), p = bad,
    female(X).


% NON-MUSCLE INVASIVE BLADDER CANCER
% full medical histry and physical exam
% additional tests:
%   - urine cytology
%   - blood tests (CMP)
%   - cystoscopy (urology exam)
%   - rigid cystoscopy
% ALOSO:
%   - transurethral resection of bladder tumor
%   - blue light cystocopy
% for staging and diagnosys:
%   - mri
%   - retrograde pyelogram\
% ==============================================================================
diagnose(X, non_muscle_invasive_bladder_cancer) :-
    urine_cytology(X, U), U = bad,
    cystoscopy(X, C), U = bad.
