**************************************************;
*  LESSON 4, PRACTICE 2 SOLUTION                 *;
**************************************************;

proc format;
    value psize low-<10000='Small'
                10000-<500000='Average'
                500000-high='Large';
run;

data np_parksize;
    set pg2.np_acres;
    ParkSize=put(GrossAcres, psize.);
    format GrossAcres comma16.;
run;
	
