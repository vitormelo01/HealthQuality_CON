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

*-------------------------------------------------------------------------------
*Appending data for all years
*-------------------------------------------------------------------------------

clear
use cleaned_hosp_mortality_readm_2008.dta
forvalues i = 2009/2016 {
	append using cleaned_hosp_mortality_readm_`i'.dta 
}

sort year 
order year, b(mort_heart_attack)

/* 
Heart failure data available from 2008-2016.
Heart attack data available from 2009-2013.
CABG data available from 2015-2016. */

save HeartMortReadm_Complete, replace

*-------------------------------------------------------------------------------
*Getting state id data based on provider id
*-------------------------------------------------------------------------------

clear
use pos2016.dta

keep prvdr_num ssa_state_cd
rename prvdr_num providerid

count if missing(real(providerid))
drop if missing(real(providerid))
destring providerid, replace
destring ssa_state_cd, replace

merge m:m providerid using HeartMortReadm_Complete.dta
drop if _merge==1

{gen fips = .
replace fips =1 if ssa_state_cd==1
replace fips =2 if ssa_state_cd==2
replace fips =4 if ssa_state_cd==3
replace fips =5 if ssa_state_cd==4
replace fips =6 if ssa_state_cd==5
replace fips =8 if ssa_state_cd==6
replace fips =9 if ssa_state_cd==7
replace fips =10 if ssa_state_cd==8
replace fips =11 if ssa_state_cd==9
replace fips =12 if ssa_state_cd==10
replace fips =13 if ssa_state_cd==11
replace fips =15 if ssa_state_cd==12
replace fips =16 if ssa_state_cd==13
replace fips =17 if ssa_state_cd==14
replace fips =18 if ssa_state_cd==15
replace fips =19 if ssa_state_cd==16
replace fips =20 if ssa_state_cd==17
replace fips =21 if ssa_state_cd==18
replace fips =22 if ssa_state_cd==19
replace fips =23 if ssa_state_cd==20
replace fips =24 if ssa_state_cd==21
replace fips =25 if ssa_state_cd==22
replace fips =26 if ssa_state_cd==23
replace fips =27 if ssa_state_cd==24
replace fips =28 if ssa_state_cd==25
replace fips =29 if ssa_state_cd==26
replace fips =30 if ssa_state_cd==27
replace fips =31 if ssa_state_cd==28
replace fips =32 if ssa_state_cd==29
replace fips =33 if ssa_state_cd==30
replace fips =34 if ssa_state_cd==31
replace fips =35 if ssa_state_cd==32
replace fips =36 if ssa_state_cd==33
replace fips =37 if ssa_state_cd==34
replace fips =38 if ssa_state_cd==35
replace fips =39 if ssa_state_cd==36
replace fips =40 if ssa_state_cd==37
replace fips =41 if ssa_state_cd==38
replace fips =42 if ssa_state_cd==39
replace fips =44 if ssa_state_cd==41
replace fips =45 if ssa_state_cd==42
replace fips =46 if ssa_state_cd==43
replace fips =47 if ssa_state_cd==44
replace fips =48 if ssa_state_cd==45
replace fips =49 if ssa_state_cd==46
replace fips =50 if ssa_state_cd==47
replace fips =51 if ssa_state_cd==49
replace fips =53 if ssa_state_cd==50
replace fips =54 if ssa_state_cd==51
replace fips =55 if ssa_state_cd==52
replace fips =56 if ssa_state_cd==53 }

drop ssa_state_cd
drop if fips==.




