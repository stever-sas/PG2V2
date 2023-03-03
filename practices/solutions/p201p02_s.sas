**************************************************;
*  LESSON 1, PRACTICE 2 SOLUTION                 *;
**************************************************;

data np_parks;
	set pg2.np_final(obs=5);
	putlog "NOTE: START DATA STEP ITERATION"; 
	length Size $ 6;
	where Type="PARK";
	Type=propcase(Type);
	putlog Type=;
	AvgMonthlyVisitors=sum(DayVisits,Campers,OtherLodging)/12;
	if Acres<1000 then Size="Small";
	else if Acres<100000 then Size="Medium";
	else Size="Large";
	format AvgMonthlyVisitors Acres comma10.;
	keep Region ParkName AvgMonthlyVisitors Acres Size;
	putlog _all_;
run;
