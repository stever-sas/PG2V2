**************************************************;
*  LESSON 2, PRACTICE 6 SOLUTION                 *;
**************************************************;

proc sort data=pg2.np_acres 
	out=sortedAcres(keep=Region ParkName State GrossAcres);
	by Region ParkName;
run;
	
data multistate singlestate;
	set sortedAcres;
	by Region ParkName;
	if first.ParkName=1 and last.ParkName=1 
		then output singlestate;
	else output multistate;
	format GrossAcres comma15.;
run;
