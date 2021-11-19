
global ruta "D:\STATA-MEDIUM\graphs\github\"

set scheme black_w3d
graph set window fontface "Arial Narrow"
xtline new_deaths_ma7, overlay xtitle("") ytitle("New deaths (7 day M-A)") 
graph export $ruta/figures/region_deaths.png, width(1000) replace

xtline new_cases_ma7, overlay xtitle("") ytitle("New cases (7 day M-A)") 
graph export $ruta/figures/region_cases.png, replace wid(1000)
twoway (scatter new_deaths_ma7 new_cases_ma7, mc(%10) ms(vsmall)), xtitle("New deaths (7 day M-A)") ytitle("New cases (7 day M-A)") 
graph export $ruta/figures/scatter_cases_deaths.png, replace wid(1000)
twoway (scatter new_cases_ma7 new_deaths_ma7, mc(pink%10) ms(vsmall)), xtitle("New cases (7 day M-A)") ytitle("New deaths (7 day M-A)") 
graph export $ruta/figures/scatter_deaths_cases.png, replace wid(1000)