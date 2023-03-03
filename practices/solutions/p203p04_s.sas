**************************************************;
*  LESSON 3, PRACTICE 4 SOLUTION                 *;
**************************************************;

data clean_traffic;
	set pg2.np_monthlytraffic;
	drop Year;
	length Type $ 5;
	Type=scan(ParkName, -1);
	Region=upcase(compress(Region));
	Location=propcase(Location);
run;
