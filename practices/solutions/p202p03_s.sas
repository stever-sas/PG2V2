**************************************************;
*  LESSON 2, PRACTICE 3 SOLUTION                 *;
**************************************************;

data cuyahoga_maxtraffic;
	set pg2.np_monthlyTraffic;
	where ParkName = 'Cuyahoga Valley NP';
	retain TrafficMax 0 MonthMax LocationMax;
	if Count>TrafficMax then do;
		TrafficMax=Count;
		MonthMax=Month;
		LocationMax=Location;
	end;
	format Count TrafficMax comma15.;
	keep Location Month Count TrafficMax MonthMax LocationMax;
run;
