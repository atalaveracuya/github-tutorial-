


global ruta "D:\STATA-MEDIUM\graphs\github\"

use "$ruta/data/OWID_data.dta", clear
merge m:1 country using "$ruta/data/country_codes.dta"
drop if _m!=3
keep country date new_cases new_deaths group*
summ date
drop if date>=r(max) - 2
gen region = .
replace region = 1 if group29==1 & country=="United States" // North America
replace region = 2 if group29==1 & country!="United States" // North America
replace region = 3 if group20==1 & country=="Brazil" // Latin America and Carribean
replace region = 4 if group20==1 & country!="Brazil" // Latin America and Carribean
replace region = 5 if group10==1 & country=="Germany" // Germany
replace region = 6 if group10==1 & country!="Germany" // Rest of EU
replace region = 7 if  group8==1 & group10!=1 & country=="United Kingdom" // Rest of Europe and Central Asia
replace region = 8 if  group8==1 & group10!=1 & country!="United Kingdom" // Rest of Europe and Central Asia
replace region = 9 if group26==1 // MENA
replace region = 10 if group37==1 // Sub-saharan Africa
replace region = 11 if group35==1 & country=="India" // South Asia
replace region = 12 if group35==1 & country!="India" // South Asia
replace region = 13 if  group6==1 // East Asia and Pacific
lab de region  1 "United States" 2 "Rest of North America" 3 "Brazil" 4 "Rest of Latin America" 5 "Germany" 6 "Rest of European Union" 7 "United Kingdom" 8 "Rest of Europe" 9 "MENA" 10 "Sub-Saharan Africa" 11 "India" 12 "Rest of South Asia" 13 "East Asia and Pacific"
lab val region region

collapse (sum) new_cases new_deaths, by(date region)

xtset region date
tssmooth ma new_cases_ma7  = new_cases , w(6 1 0) 
tssmooth ma new_deaths_ma7  = new_deaths , w(6 1 0) 
 
format date %tdDD-Mon-YY
format new_cases %9.0fc