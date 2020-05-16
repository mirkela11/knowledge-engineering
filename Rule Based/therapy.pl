%------------------------------------------------------------------------------------------------------------------DATA
gleason_score(john,6).
male(john).

child(X) :- age(X,Y), Y=<12.
adolescent(X) :- age(X,Y), Y=<19, Y>=13.
adult(X) :- age(X,Y), Y<55, Y>=20.
elder(X) :- age(X,Y), Y>=55.

%prostate_cancer_stage1(X) :- tumor_size(X,Y), Y = very_small, blood_test(X,Y), Y=very_low.
%prostate_cancer_stage2(X) :- tumor_size(X,Y), Y = small, blood_test(X,Y), Y=low.
%prostate_cancer_stage3(X) :- tumor_size(X,Y), Y = intermediate, blood_test(X,Y), Y=intermediate.
%prostate_cancer_stage4(X) :- tumor_size(X,Y), Y = big, blood_test(X,Y), Y=high.

%--------------------------------------------------------------------------------------------------------------------Prostate cancer
%therapies
surveillance(X) :-  male(X),tumor_type(X,Y), Y=benign,
                   (prostate_cancer_stage1(X); prostate_cancer_stage2(X));
                   (adult(X); elder(X)).

radical_surgery(X) :-   male(X),no_health_issues(X), 
                      (prostate_cancer_stage1(X); prostate_cancer_stage2(X); prostate_cancer_stage3(X));
                      (adult(X); elder(X)).

radiation(X) :-   male(X),no_health_issues(X),
                (prostate_cancer_stage2(X); prostate_cancer_stage3(X); prostate_cancer_stage4(X));
                (adult(X); elder(X)).


focal_therapy(X):-  male(X),(prostate_cancer_stage1(X); prostate_cancer_stage2(X));
                   (adult(X); elder(X)).

cryotherapy(X) :-   male(X),health_issues(X),
                  (prostate_cancer_stage1(X); prostate_cancer_stage2(X));
                  (adult(X); elder(X)).

%--posle radijacije se preporucuje ili sa radijaciom
hormonal_therapy(X) :-  male(X),(prostate_cancer_stage2(X); prostate_cancer_stage3(X); prostate_cancer_stage4(X));
                       (adult(X); elder(X)).


chemotherapy(X):-   male(X),prostate_cancer_stage4(X),
                  (adult(X); elder(X)).

%--posle hemoterapije se preporucuje ili sa hemoterapijom
immunotherapy(X) :-  male(X),( prostate_cancer_stage1(X); prostate_cancer_stage2(X);prostate_cancer_stage3(X);prostate_cancer_stage4(X));
                    (adult(X); elder(X)).

%-- sa hormonal_therapy
bone_targeted_therapy(X) :-  male(X),(prostate_cancer_stage3(X);prostate_cancer_stage4(X)),
                            (adult(X); elder(X)).

%--------------------------------------------------------------------------------------------------------------------------Non-Muscle Invasive Bladder Cancer
%therapies

cystoscopy(X) :- elder(X),
                 bladder_cancer_stage(X,Y), Y=ta, 
                 first_time_cancer(X,Y), Y=yes.

bladder_surgery_and_chemotherapy :- elder(X), 
                                    bladder_cancer_stage(X,Y), Y=ta,
                                    bladder_cancer_grade(X,Y), Y=low,
                                    cancer_is_back(X,Y),Y=yes.

bladder_surgery_and_immunotherapy(X) :- elder(X),
                                        bladder_cancer_stage(X,Y), Y=ta,
                                        bladder_cancer_grade(X,Y), Y=high,
                                        cancer_is_back(X,Y),Y=yes.

cystoscopy_and_immunotherapy(X) :- elder(X),
                                   bladder_cancer_stage(X,Y),Y=tis.

immunotherapy(X) :- elder(X),
                    (health_issues(X),
                    ((bladder_cancer_grade(X,Y), Y=low,cancer_removed(X,Y),Y=yes);
                    (bladder_cancer_grade(X,Y), Y=high)), bladder_cancer_stage(X,Y), Y=t1);
                     bladder_cancer_stage(X,Y), Y=t4.

chemotherapy(X) :-  elder(X),
                   (no_health_issues(X),
                   ((bladder_cancer_grade(X,Y), Y=low,cancer_removed(X,Y),Y=no);
                   (bladder_cancer_grade(X,Y), Y=high)));
                   bladder_cancer_stage(X,Y), Y=t4.

surgery(X) :- elder(X),
              bladder_cancer_stage(X,Y), Y=t1,
              no_health_issues(X),
              bladder_cancer_grade(X,Y), Y=high.

cystoscopy_chemotherapy_surgery(X) :- elder(X),
                                      bladder_cancer_stage(X,Y), Y=t2.

immunotherapy_chemotherapy_surgery(X) :- elder(X),
                                         bladder_cancer_stage(X,Y), Y=t3.

%---------------------------------------------------------------------------------------------------------------------------------------------Bladder Prolapse
kegel_exercise(X) :- female(X),
                     prolapse_bladder_grade(X,Y), (Y=mild;Y=moderate),
                    (adolescent(X);adult(X);elder(X)).

pessary(X) :- female(X),
              prolapse_bladder_grade(X,Y), (Y=moderate;Y=severe),
             (adolescent(X);adult(X);elder(X)).

estrogen_replacement_therapy(X) :- female(X),
                                   prolapse_bladder_grade(X,Y), Y=severe,
                                   (adolescent(X);adult(X);elder(X)).

bladder_surgery(X) :- female(X),
                      prolapse_bladder_grade(X,Y), Y=complete,
                      (adolescent(X);adult(X);elder(X)).

%-------------------------------------------------------------------------------------------------------------------------------------------Hematuria

antibiotics_for_urinary_tract(X) :- red_blood_cells_in_urine(X,Y), Y=yes, infection_of_urine_tract(X,Y),Y=infected.
prescription_medication_to_shrink_prostate(X) :- male(X), (adult(X);elder(X)), red_blood_cells_in_urine(X,Y), Y=yes, enlarged_prostate(X,Y), Y=yes.
shock_waves_therapy(X) :- red_blood_cells_in_urine(X,Y), Y=yes, ((stones_in_kidneys(X,Y), Y=yes);(stones_in_bladder(X,Y),Y=yes)).   

%-----------------------------------------------------------------------------------------------------------------------------------------Infection of the Prostate(Prostatitis)

tmp_smx_antibiotic(X) :-  male(X),
                         bacterial_infection_prostatitis(X,Y),Y=yes.
                      

%najvise se preporucuje tmp-smx antibiotik
doxycycline_antibiotic :- male(X),
                          bacterial_infection_prostatitis(X,Y),Y=yes.

horfloxacin_antibiotic(X) :- male(X),
                             bacterial_infection_prostatitis(X,Y),Y=yes.

%vise se preporucuje doxycycline
doxycycline_with_anti_inflammatory_drugs_and_prostate_massage(X) :- male(X),
                                                                    chronic_nonbacteria_prostatitis(X,Y),Y=yes.  

minocycline_with_anti_inflammatory_drugs_and_prostate_massage(X) :- male(X),
                                                                    chronic_nonbacteria_prostatitis(X,Y),Y=yes.  

regular_psa_checks(X) :- male(X),
                         asymptomatic_inflammatory_prostatitis(X,Y),Y=yes.

%-----------------------------------------------------------------------------------------------------------------------------------------------------Urinary Tract Infection

hormone_replacement_with_estrogen(X) :- female(X),
                                        elder(X),
                                        simple_uti(X,Y),Y=yes.

nitrofurantoin(X) :- female(X),
                     simple_uti(X,Y),Y=yes.

fosfomycin(X) :- female(X),
                 simple_uti(X,Y),Y=yes.

drink_lot_of_liquids_and_vitamin_C(X) :- (simple_uti(X,Y),Y=yes);
                                         (complicated_uti(X,Y),Y=yes).

amoxicillin(X) :- (simple_uti(X,Y),Y=yes);
                  (complicated_uti(X,Y),Y=yes).

cephalexin(X) :- (simple_uti(X,Y),Y=yes);
                 (complicated_uti(X,Y),Y=yes). 

ciprofloxacin(X) :- (simple_uti(X,Y),Y=yes);
                    (complicated_uti(X,Y),Y=yes). 

%------------------------------------------------------------------------------------------------------------------------------------------------------Low Testosterone
%pacijent bira terapiju,koja mu najvise odgovara
testosterone_skin_patch(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_gel(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_tablets(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_injection(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 
testosterone_pellets(X) :- male(X), (adult(X);elder(X)), low_testosterone(X). 

%-------------------------------------------------------------------------------------------------------------------------------------------------------Kidney Stones

wait_for_stones_to_pass_itself(X) :- stones_in_kidneys(X,Y),Y=yes,
                                     stone_size(X,Y),Y=small,
                                     kidney_is_functional(X,Y), Y=yes.

drink_lot_of_water(X) :- stones_in_kidneys(X,Y),Y=yes,
                         stone_size(X,Y),Y=small,
                         kidney_is_functional(X,Y), Y=yes.

tamsulosin(X) :- stones_in_kidneys(X,Y),Y=yes,
                 stone_size(X,Y),Y=small,
                 kidney_is_functional(X,Y), Y=yes.

shock_wave_lithotripsy(X) :- stones_in_kidneys(X,Y),Y=yes,
                             stone_size(X,Y), (Y=small;Y=medium),
                             stone_hardness(X,Y),Y=not_hard,
                             kidney_is_functional(X,Y), Y=no.

ureteroscopy(X) :- stones_in_kidneys(X,Y),Y=yes,
                   stone_size(X,Y),(Y=medium;Y=large),
                   stone_hardness(X,Y),Y=hard,
                   kidney_is_functional(X,Y), Y=no.

percutaneous_nephrolithotomy(X) :- stones_in_kidneys(X,Y),Y=yes,
                                   stone_size(X,Y), Y=large,
                                   stone_hardness(X,Y),Y=hard,
                                   kidney_is_functional(X,Y), Y=no.

%-------------------------------------------------------------------------------------------------------------------------------------------------------------Kidney Cancer

radiofrequency_ablatation(X) :- renal_stage_1(X).

cryoablatation(X) :- renal_stage_1(X).

radical_nephrectomy(X) :- no_health_issues(X),
                         (renal_stage_1(X);renal_stage_2(X);renal_stage_3(X);renal_stage_4(X)).

partial_nephrectomy(X) :- renal_stage_1(X);
                          renal_stage_2(X).

radiation_therapy(X) :- health_issues(X),
                        (renal_stage_1(X);renal_stage_2(X);renal_stage_3(X);renal_stage_4(X)).

arterial_embolazation(X) :- renal_stage_1(X);
                            renal_stage_2(X);
                            renal_stage_3(X).

targeted_therapy(X) :- renal_stage_4(X).

biologic_therapy(X) :- renal_stage_4(X).



