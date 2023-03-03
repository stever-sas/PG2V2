**************************************************;
*  LESSON 2, PRACTICE 4 SOLUTION                 *;
**************************************************;

proc sort data=pg2.np_yearlyTraffic 
		  out=work.sortedTraffic(keep=ParkType ParkName Location Count);
	by ParkType ParkName;
run;

data TypeTraffic;
	set work.sortedTraffic;
	by ParkType;
	if first.ParkType=1 then TypeCount=0;
	TypeCount+Count;
	if last.ParkType=1;
	format typeCount comma12.;
	keep ParkType TypeCount;
run;

/*ALTERNATE SOLUTION*/

data TypeTraffic;
	set work.sortedTraffic;
	by ParkType;
	retain TypeCount 0;
	if first.ParkType=1 then TypeCount=0;
	TypeCount=TypeCount+Count;
	if last.ParkType=1;
	format TypeCount comma12.;
	keep ParkType TypeCount;
run;

