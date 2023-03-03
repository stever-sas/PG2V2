**************************************************;
*  LESSON 3, PRACTICE 1 SOLUTION                 *;
**************************************************;

proc print data=pg2.np_lodging(obs=10);
	where CL2010>0;
run;

data stays;
	set pg2.np_lodging;
	Stay1=largest(1, of CL:);
	Stay2=largest(2, of CL:);
	Stay3=largest(3, of CL:);
	StayAvg=round(mean(of CL:));
	if StayAvg > 0;
	keep Park Stay:;
	format Stay: comma11.;
run;
