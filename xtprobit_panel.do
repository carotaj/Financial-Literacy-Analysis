
************************ RESTRICTED 2020 SAMPLE ********************************
clear 
set seed 777
set more 1

*Set working directory
cd "/Users/marcellocarota/Desktop/UNIVERSITà/MAGISTRALE/QUANTITATIVE ECONOMICS/SECONDO ANNO/APPLIED ECONOMICS/PROGETTO 9:24/datasets/"

use "q20c2.dta", clear

*Merge the other datasets
*dataset personal info
joinby nquest using "carcom20.dta"
*dataset 'deposit'
joinby nquest using "q20c1.dta" 
*dataset 'y'
joinby nquest using "rfam20.dta"


*Keep only the info about the "capofamiglia"
drop if nord!=1
drop if nordp!=1

rename qrisk1 qrisk1_20
rename qint qint_20
rename qtasso qtasso_20

*recoding
generate codqtasso_20 = 1000
replace codqtasso_20 = 0 if qtasso_20 != 3
replace codqtasso_20 = 1 if qtasso_20 == 3

tabulate codqtasso_20

generate codqint_20 = 1000
replace codqint_20 = 0 if qint_20 != 2
replace codqint_20 = 1 if qint_20 == 2

tabulate codqint_20

generate codqrisk1_20 = 1000
replace codqrisk1_20 = 0 if qrisk1_20 != 2
replace codqrisk1_20 = 1 if qrisk1_20 == 2

tabulate codqrisk1_20

*Combine these three variables into 1
gen finliteracy_20 = codqtasso_20 + codqint_20 + codqrisk1_20
gen year=2020

****************** dummy variable adjustment ******************
******* SEX *******
*uomo
replace sex = 0 if sex == 1 
*donna
replace sex = 1 if sex == 2

******* DEPOSITS *******
replace deposit = 0 if deposit == 2

****** INCOME LOG *******
replace y = ln(y)
replace y = 0 if missing(y)

rename finliteracy_20 finliteracy, replace

keep year nquest sex eta y studio area5 deposit qual finliteracy

browse year nquest sex eta y studio area5 deposit qual finliteracy

save "restricted_2020.dta", replace



************************* RESTRICTED SAMPLE 2016 ******************************

use "q20c2.dta", clear

*Merge the other datasets
*dataset personal info
joinby nquest using "carcom20.dta"
*dataset 'deposit'
joinby nquest using "q20c1.dta" 
*dataset 'y'
joinby nquest using "rfam20.dta"

*Keep only the info about the "capofamiglia"
drop if nord!=1
drop if nordp!=1
keep nquest
tempfile remaining_ids
save `remaining_ids', replace

use "q16c2.dta", clear

*Merge the other datasets
*dataset personal info
joinby nquest using "carcom16.dta"
*dataset 'deposit'
joinby nquest using "q16c1.dta" 
*dataset 'y'
joinby nquest using "rfam16.dta"


*Keep only the info about the "capofamiglia"
drop if nord!=1

duplicates report nquest

duplicates drop nquest, force

merge 1:1 nquest using `remaining_ids'

keep if _merge == 3

drop _merge

summarize nquest

save "detailed_q16.dta", replace

rename qrisk1 qrisk1_16
rename qint qint_16
rename qtasso qtasso_16

*recoding
generate codqtasso_16 = 1000
replace codqtasso_16 = 0 if qtasso_16 != 3
replace codqtasso_16 = 1 if qtasso_16 == 3

tabulate codqtasso_16

generate codqint_16 = 1000
replace codqint_16 = 0 if qint_16 != 2
replace codqint_16 = 1 if qint_16 == 2

tabulate codqint_16

generate codqrisk1_16 = 1000
replace codqrisk1_16 = 0 if qrisk1_16 != 2
replace codqrisk1_16 = 1 if qrisk1_16 == 2

tabulate codqrisk1_16

*Combine these three variables into 1
gen finliteracy_16 = codqtasso_16 + codqint_16 + codqrisk1_16
gen year=2016
****************** dummy variable adjustment ******************
******* SEX *******
*uomo
replace sex = 0 if sex == 1 
*donna
replace sex = 1 if sex == 2

******* DEPOSITS *******
replace deposit = 0 if deposit == 2

****** INCOME LOG *******
replace y = ln(y)
replace y = 0 if missing(y)

rename finliteracy_16 finliteracy, replace

keep year nquest sex eta y studio area5 deposit qual finliteracy

browse year nquest sex eta y studio area5 deposit qual finliteracy

save "restricted_2016.dta"

********************************************************************************

use restricted_2016.dta, clear

append using restricted_2020.dta, force

browse year nquest sex eta y studio area5 deposit qual finliteracy

xtset nquest year

xtprobit finliteracy y eta i.deposit i.area5 i.studio i.sex i.qual, re
