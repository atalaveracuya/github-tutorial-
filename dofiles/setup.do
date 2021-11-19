

global ruta "D:\STATA-MEDIUM\graphs\github\"
************************
***  COVID 19 data   ***
************************
insheet using "https://covid.ourworldindata.org/data/owid-covid-data.csv", clear
gen date2 = date(date, "YMD")
format date2 %tdDD-Mon-yy
drop date
ren date2 date
ren location country
replace country = "Slovak Republic" if country == "Slovakia"
replace country = "Czech Republic"  if country == "Czechia"
replace country = "Kyrgyz Republic" if country == "Kyrgyzstan"
replace country = "Macedonia"   if country == "North Macedonia"
drop if date < 21915
save "$ruta/data/OWID_data.dta", replace
**********************************
***  Country classifications   ***
**********************************
  
copy "https://github.com/asjadnaqvi/COVID19-Stata-Tutorials/blob/master/master/country_codes.dta?raw=true" "$ruta/data/country_codes.dta", replace