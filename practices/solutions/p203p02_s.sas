**************************************************;
*  LESSON 3, PRACTICE 2 SOLUTION                 *;
**************************************************;

data rainsummary;
	set pg2.np_hourlyrain;
	by Month;
	if first.Month=1 then MonthlyRainTotal=0;
	MonthlyRainTotal+Rain;
	if last.Month=1;
	Date=datepart(DateTime);
	MonthEnd=intnx('month',Date,0,'end');
	format Date MonthEnd date9.;
	keep StationName MonthlyRainTotal Date MonthEnd;
run;
