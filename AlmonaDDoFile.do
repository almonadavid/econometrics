* This is a do-file for ECO 390 final project

 use "C:\Users\almon\OneDrive\Desktop\ECO 390\Final Project\AlmonaDData.dta" 
 
 * View Summary Stats
 *TABLE 1: SUMMARY STATS
 summarize
 
 *Let's sort Country and Year
 sort Country Year
 
 *Let's run a linear regression
 *TABLE 2: LINEAR REGRESSION MODEL
 reg medalcount gnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour asia africa northamerica europe southamerica

 *Checking if asia=africa=northamerica=europe=southamerica=0
 test asia africa northamerica europe southamerica
 
 estat vif
 estat ic
 
 *Let's generate dummy variables for all the countries
 tab Country, gen(cntry)
 
 *Let's generate dummy variables for the years
 tab Year, gen(Yr)
 
 *Should I generate dummy variables for govsystem???
 
 *Re-run linear regression in TABLE 2, removing the continents and adding the new generated dummy variables
 *TABLE 3: ...
 reg medalcount gnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfou timeshost failedbid numathletes medallastfour cntry1-cntry124 cntry126-cntry185
 *In this data, cntry125==Nigeria
 *
 *
 *Let's run linear regression but absorbing the Country variables
 *TABLE 4: ...
 areg medalcount gnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 ********************************************************************************************
 
 *Let's generate modifications of variables
 gen lnmedalcount = ln(medalcount)
 gen lngnippp = ln(gnippp)
 gen lnnumathletes = ln(numathletes)
 gen lnpopulation = ln(population)
 gen lnhealthexpendppp = ln(healthexpendppp)
 
 gen urbpoppct2 = (((urbpoppct/100)^2)*100)
 ********************************************************************************************
 *Didn't he ask for just 3 regression results*
 
 *Let's run a LHS semi-log regression
 *TABLE 5: LHS SEMI-LOG REGRESSION MODEL
 areg lnmedalcount gnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 
 *Let's run a RHS semi-log regression
 *TABLE 6: RHS SEMI-LOG REGRESSION MODEL
 areg medalcount lngnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 
 *Let's run a double-log regression
 *TABLE 7: DOUBLE-LOG REGRESSION MODEL
 areg lnmedalcount lngnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 
 *Let's run a quadratic regression
 *TABLE 8: QUADRATIC REGRESSION MODEL
 areg medalcount gnippp population urbpoppct urbpoppct2 healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 
 *After multiple behind-the-scenes testing, this is the best fit regression using lngnippp...
 *TABLE 9: 2ND BEST MODEL(using only lngnippp)
 areg medalcount lngnippp population urbpoppct healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 
 
 *TABLE 9: BEST MODEL(using lngnippp and urbpoppct2)
 areg medalcount lngnippp population urbpoppct urbpoppct2 healthexpendppp hostnow hostinfour hostlastfour timeshost failedbid numathletes medallastfour Yr1-Yr3, absorb(Country)
 estat ic
 


 
 
 
 
 
 