%Prostate cancer
gleason_score(john,6).
male(john).

child(X) :- age(X,Y), Y=<12.
adolescent(X) :- age(X,Y), Y=<19, Y>=13.
adult(X) :- age(X,Y), Y<55, Y>=20.
elder(X) :- age(X,Y), Y>=55.

low_risk_category(X) :- male(X), gleason_score(X,Y), Y>=1, Y=<6.
intermediate_risk_category(X) :- male(X), gleason_score(X,7).
high_risk_category(X) :- male(X), gleason_score(X,Y), Y>=8, Y=<10.

prostate_cancer_stage1(X) :- tumor_size(X,Y), Y = very_small, blood_test(X,Y), Y=very_low.
prostate_cancer_stage2(X) :- tumor_size(X,Y), Y = small, blood_test(X,Y), Y=low.
prostate_cancer_stage3(X) :- tumor_size(X,Y), Y = intermediate, blood_test(X,Y), Y=intermediate.
prostate_cancer_stage4(X) :- tumor_size(X,Y), Y = big, blood_test(X,Y), Y=high.

%therapies
surveillance(X) :- tumor_type(X,Y), Y=benign,low_risk_category(X),( prostate_cancer_stage1(X); prostate_cancer_stage2(X) );(adult(X); elder(X)).
radical_surgery(X) :- other_health_issues(X,Y), Y=no, high_risk_category(X),( prostate_cancer_stage1(X); prostate_cancer_stage2(X); prostate_cancer_stage3(X)) ; (adult(X); elder(X)).
radiation(X) :- other_health_issues(X,Y), Y=no, (intermediate_risk_category(X);high_risk_category(X)), (prostate_cancer_stage2(X); prostate_cancer_stage3(X); prostate_cancer_stage4(X)); (adult(X); elder(X)).
focal_therapy(X):- (low_risk_category(X); intermediate_risk_category(X)), ( prostate_cancer_stage1(X); prostate_cancer_stage2(X) ) ; (adult(X); elder(X)).
cryotherapy(X) :- other_health_issues(X,Y), Y=yes, (intermediate_risk_category(X);high_risk_category(X)), (prostate_cancer_stage1(X); prostate_cancer_stage2(X)); (adult(X); elder(X)).
hormonal_therapy(X) :- radiation(X); (high_risk_category(X), (prostate_cancer_stage2(X); prostate_cancer_stage3(X); prostate_cancer_stage4(X)); (adult(X); elder(X))).
chemotherapy(X):- high_risk_category(X), prostate_cancer_stage4(X),(adult(X); elder(X)).
immunotherapy(X) :- chemotherapy(X); ((low_risk_category(X); intermediate_risk_category(X)), ( prostate_cancer_stage1(X); prostate_cancer_stage2(X),prostate_cancer_stage3(X),prostate_cancer_stage4(X)) ; (adult(X); elder(X))).
bone_targeted_therapy(X) :- hormonal_therapy(X) ; (high_risk_category(X),(prostate_cancer_stage3(X);prostate_cancer_stage4(X)),(adult(X); elder(X))).

%Non-Muscle Invasive Bladder Cancer
%therapies

cystoscopy(X) :- elder(X), bladder_cancer_stage(X,Y), Y=ta, first_time_cancer(X,Y), Y=yes.
bladder_surgery_and_chemotherapy :- elder(X), bladder_cancer_stage(X,Y), Y=ta, bladder_cancer_grade(X,Y), Y=low, cancer_is_back(X,Y),Y=yes.
bladder_surgery_and_immunotherapy(X) :- elder(X), bladder_cancer_stage(X,Y), Y=ta, bladder_cancer_grade(X,Y), Y=high, cancer_is_back(X,Y),Y=yes.

cystoscopy_and_immunotherapy(X) :- elder(X), bladder_cancer_stage(X,Y),Y=tis.

immunotherapy(X) :- elder(X),(health(X,Y), Y=not_good, ((bladder_cancer_grade(X,Y), Y=low,cancer_removed(X,Y),Y=yes);(bladder_cancer_grade(X,Y), Y=high)), bladder_cancer_stage(X,Y), Y=t1); bladder_cancer_stage(X,Y), Y=t4.
chemotherapy(X) :- elder(X),(health(X,Y),Y=good, ((bladder_cancer_grade(X,Y), Y=low,cancer_removed(X,Y),Y=no);(bladder_cancer_grade(X,Y), Y=high))) ; bladder_cancer_stage(X,Y), Y=t4.
surgery(X) :- elder(X), bladder_cancer_stage(X,Y), Y=t1, health(X,Y),Y=good,bladder_cancer_grade(X,Y), Y=high.

cystoscopy_chemotherapy_surgery(X) :- elder(X), bladder_cancer_stage(X,Y), Y=t2.
immunotherapy_chemotherapy_surgery(X) :- elder(X), bladder_cancer_stage(X,Y), Y=t3.

%Bladder Prolapse
kegel_exercise(X) :- female(X), prolapse_bladder_grade(X,Y), (Y=mild;Y=moderate), (adolelescent(X);adult(X);elder(X)).
pessary(X) :- female(X), prolapse_bladder_grade(X,Y), (Y=moderate;Y=severe), (adolelescent(X);adult(X);elder(X)).
estrogen_replacement_therapy(X) :- female(X), prolapse_bladder_grade(X,Y), Y=severe, (adolelescent(X);adult(X);elder(X)).
bladder_surgery(X) :- female(X), prolapse_bladder_grade(X,Y), Y=complete, (adolelescent(X);adult(X);elder(X)).

%Hematuria
antibiotics_for_urinary_tract(X) :- red_blood_cells_in_urine(X,Y), Y=yes, infection_of_urine_tract(X,Y),Y=infected.
prescription_medication_to_shrink_prostate(X) :- male(X), (adult(X);elder(X)), red_blood_cells_in_urine(X,Y), Y=yes, enlarged_prostate(X,Y), Y=yes.
shock_waves_therapy(X) :- red_blood_cells_in_urine(X,Y), Y=yes, ((stones_in_kidneys(X,Y), Y=yes);(stones_in_bladder(X,Y),Y=yes)).   

%Infection of the Prostate(Prostatitis)
tmp_smx_antibiotic(X) :- male(X), (acute_bacterial_infection_prostatitis(X,Y),Y=yes);(chronic_bacterial_infection_prostatitis(X,Y),Y=yes).
%najvise se preporucuje tmp-smx antibiotik
doxycycline_antibiotic :- male(X), acute_bacterial_infection_prostatitis(X,Y),Y=yes.
horfloxacin_antibiotic(X) :- male(X), chronic_bacterial_infection_prostatitis(X,Y),Y=yes.
%vise se preporucuje doxycycline
doxycycline_with_anti_inflammatory_drugs_and_prostate_massage(X) :- male(X), chronic_nonbacteria_prostatitis(X,Y),Y=yes.  
minocycline_with_anti_inflammatory_drugs_and_prostate_massage(X) :- male(X), chronic_nonbacteria_prostatitis(X,Y),Y=yes.  
regular_psa_checks(X) :- male(X), asymptomatic_inflammatory_prostatitis(X,Y),Y=yes.

%Urinary Tract Infection
hormone_replacement_with_estrogen(X) :- female(X),elder(X), simple_uti(X,Y),Y=yes.
nitrofurantoin(X) :- female(X), simple_uti(X,Y),Y=yes.
fosfomycin(X) :- female(X), simple_uti(X,Y),Y=yes.
drink_lot_of_liquids_and_vitamin_C(X) :- (simple_uti(X,Y),Y=yes);(complicated_uti(X,Y),Y=yes).
amoxicillin(X) :- (simple_uti(X,Y),Y=yes);(complicated_uti(X,Y),Y=yes).
cephalexin(X) :- (simple_uti(X,Y),Y=yes);(complicated_uti(X,Y),Y=yes). 
ciprofloxacin(X) :- (simple_uti(X,Y),Y=yes);(complicated_uti(X,Y),Y=yes). 

%Low Testosterone
%pacijent bira terapiju,koja mu najvise odgovara
testosterone_skin_patch(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_gel(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_tablets(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_injection(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_pellets(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 



