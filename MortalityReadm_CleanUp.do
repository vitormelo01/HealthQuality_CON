* Mortality and Readmissions data clean up

clear
cd "D:\OneDrive\HealthQuality_Resources\Data"
*-------------
*2016 Clean Up
*-------------
use hosp_mortality_readm_2016.dta

* Destringing id and keeping variables of interest
keep providerid measurename hospname measureid score 
gen year=2016
destring providerid, replace

* Reshaping data
drop measurename hospname
reshape wide score, i(providerid) j(measureid) string
rename scoreMORT_30_HF mort_heart_failure
rename scoreREADM_30_HF readm_heart_failure
rename scoreMORT_30_CABG mort_CABG
rename scoreREADM_30_CABG readm_CABG

keep year providerid mort_heart_failure readm_heart_failure mort_CABG readm_CABG


save cleaned_hosp_mortality_readm_2016.dta, replace 
*-------------
*2015 Clean Up
*-------------
clear 
use hosp_mortality_readm_2015.dta

* Deletting VA hospitals (with f in provider id)
list providerid if missing(real(providerid))
count if missing(real(providerid))
drop if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname measureid score 
gen year=2015

* Reshaping data
drop measurename hospname
reshape wide score, i(providerid) j(measureid) string
rename scoreMORT_30_HF mort_heart_failure
rename scoreREADM_30_HF readm_heart_failure
rename scoreMORT_30_CABG mort_CABG
rename scoreREADM_30_CABG readm_CABG

keep year providerid mort_heart_failure readm_heart_failure mort_CABG readm_CABG

save cleaned_hosp_mortality_readm_2015.dta, replace 
*-------------
*2014 Clean Up
*-------------
clear 
use hosp_mortality_readm_2014.dta

* Deletting VA hospitals (with f in provider id)
list providerid if missing(real(providerid))
count if missing(real(providerid))
drop if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname measureid score 
gen year=2014

* Reshaping data
drop measurename hospname
reshape wide score, i(providerid) j(measureid) string
rename scoreMORT_30_HF mort_heart_failure
rename scoreREADM_30_HF readm_heart_failure
keep year providerid mort_heart_failure readm_heart_failure 


save cleaned_hosp_mortality_readm_2014.dta, replace 

*-------------
*2013 Clean Up
*-------------
clear 
use hosp_mortality_readm_2013.dta

* Destringing Score variables
replace morreadl="." if morreadl=="Not Available"
replace morreadu="." if morreadu=="Not Available"
destring morreadl, replace
destring morreadu, replace
gen score = (morreadl+morreadu)/2

* Deletting VA hospitals (with f in provider id)
rename provider providerid
list providerid if missing(real(providerid))
count if missing(real(providerid))
drop if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname state score 
gen year=2013

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Heart Failure Death (Mortality) Rates"
replace measureid = "readm_heart_failure" if measurename== "Heart Failure Readmission Rates"
replace measureid = "mort_heart_attack" if measurename== "Heart Attack Death (Mortality) Rates"
replace measureid = "readm_heart_attack" if measurename== "Heart Attack Readmission Rates"

* Reshaping data
drop measurename hospname state
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scorereadm_heart_failure readm_heart_failure
rename scoremort_heart_attack mort_heart_attack
rename scorereadm_heart_attack readm_heart_attack

save cleaned_hosp_mortality_readm_2013.dta, replace 

*-------------
*2012 Clean Up
*-------------
clear 
use hosp_mortality_readm_2012.dta

* Destringing Score variables
rename mortality_readmrate score
replace score="." if score=="Not Available"
destring score, replace

* Deletting VA hospitals (with f in provider id)
rename provider providerid
list providerid if missing(real(providerid))
count if missing(real(providerid))
drop if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname state score 
gen year=2012

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Heart Failure Death (Mortality) Rates"
replace measureid = "readm_heart_failure" if measurename== "Heart Failure Readmission Rates"
replace measureid = "mort_heart_attack" if measurename== "Heart Attack Death (Mortality) Rates"
replace measureid = "readm_heart_attack" if measurename== "Heart Attack Readmission Rates"

* Reshaping data
drop measurename hospname state
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scorereadm_heart_failure readm_heart_failure
rename scoremort_heart_attack mort_heart_attack
rename scorereadm_heart_attack readm_heart_attack

save cleaned_hosp_mortality_readm_2012.dta, replace 

*-------------
*2011 Clean Up
*-------------
clear 
use hosp_mortality_readm_2011.dta

* Destringing Score variables
rename mortality_readmrate score
replace score="." if score=="N/A"
destring score, replace

* Deletting VA hospitals (with f in provider id)
rename provider providerid
list providerid if missing(real(providerid))
count if missing(real(providerid))
drop if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname state score 
gen year=2011

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Heart Failure Death (Mortality) Rates"
replace measureid = "readm_heart_failure" if measurename== "Heart Failure Readmission Rates"
replace measureid = "mort_heart_attack" if measurename== "Heart Attack Death (Mortality) Rates"
replace measureid = "readm_heart_attack" if measurename== "Heart Attack Readmission Rates"

* Reshaping data
drop measurename hospname state
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scorereadm_heart_failure readm_heart_failure
rename scoremort_heart_attack mort_heart_attack
rename scorereadm_heart_attack readm_heart_attack

save cleaned_hosp_mortality_readm_2011.dta, replace 

*-------------
*2010 Clean Up
*-------------
clear 
use hosp_mortality_readm_2010.dta

* Destringing Score variables
rename mortality_readmrate score
replace score="." if score=="N/A"
destring score, replace

* Deletting VA hospitals (with f in provider id)
rename provider providerid
count if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname state score 
gen year=2010

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Heart Failure Death (Mortality) Rates"
replace measureid = "readm_heart_failure" if measurename== "Heart Failure Readmission Rates"
replace measureid = "mort_heart_attack" if measurename== "Heart Attack Death (Mortality) Rates"
replace measureid = "readm_heart_attack" if measurename== "Heart Attack Readmission Rates"

* Reshaping data
drop measurename hospname state
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scorereadm_heart_failure readm_heart_failure
rename scoremort_heart_attack mort_heart_attack
rename scorereadm_heart_attack readm_heart_attack

save cleaned_hosp_mortality_readm_2010.dta, replace 

*-------------
*2009 Clean Up
*-------------
clear 
use hosp_mortality_readm_2009.dta

* Generating score variable from lower and higher bound estimates
gen score = (morreadl+morreadu)/2

* Deletting VA hospitals (with f in provider id)
rename provider providerid
count if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname score 
gen year=2009

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Hospital 30-Day Death (Mortality) Rates for Heart Failure"
replace measureid = "readm_heart_failure" if measurename== "Hospital 30-Day Readmission Rates for Heart Failure"
replace measureid = "mort_heart_attack" if measurename== "Hospital 30-Day Death (Mortality) Rates for Heart Attack"
replace measureid = "readm_heart_attack" if measurename== "Hospital 30-Day Readmission Rates for Heart Attack"

* Reshaping data
drop measurename hospname
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scorereadm_heart_failure readm_heart_failure
rename scoremort_heart_attack mort_heart_attack
rename scorereadm_heart_attack readm_heart_attack

save cleaned_hosp_mortality_readm_2009.dta, replace 

*-------------
*2008 Clean Up
*-------------
clear 
use hosp_mortality_readm_2008.dta

* Generating score variable from lower and higher bound estimates
gen score = (lowermortalityestimate+uppermortalityestimate)/2

* Deletting VA hospitals (with f in provider id)
rename provider providerid
count if missing(real(providerid))

* Destringing id and keeping variables of interest
destring providerid, replace
keep providerid measurename hospname score 
gen year=2008

* Creating varibles names before reshaping
gen measureid = "."
replace measureid = "mort_heart_failure" if measurename== "Hospital 30-Day Death (Mortality) Rates from Heart Failure"
replace measureid = "mort_heart_attack" if measurename== "Hospital 30-Day Death (Mortality) Rates from Heart Attack"

* Reshaping data
drop measurename hospname
drop if measureid == "."
reshape wide score, i(providerid) j(measureid) string
rename scoremort_heart_failure mort_heart_failure
rename scoremort_heart_attack mort_heart_attack

save cleaned_hosp_mortality_readm_2008.dta, replace








