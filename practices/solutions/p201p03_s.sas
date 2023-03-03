**************************************************;
*  LESSON 1, PRACTICE 3 SOLUTION                 *;
**************************************************;

data monument(drop=ParkType) park(drop=ParkType) other;
	set pg2.np_yearlytraffic;
	if ParkType = 'National Monument' then output monument;
	else if ParkType = 'National Park' then output park;
	else output other;
	drop Region;
run;
