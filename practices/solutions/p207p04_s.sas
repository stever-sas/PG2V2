**************************************************;
*  LESSON 7, PRACTICE 4 SOLUTION                 *;
**************************************************;

proc print data=pg2.np_2017camping(obs=5);
run;

proc transpose data=pg2.np_2017camping
	           out=work.camping2017_t(rename=(COL1=Count))
	           name=Location;
	by ParkName;
	var Tent RV;
run;
