***********************************************************;
*  LESSON 6, PRACTICE 3                                   *;
*  b) Add a DO loop to the DATA step to produce the       *;
*     following results. The MPG value is increasing      *;
*     by three percent per year.                          *;
*  c) Modify the DO statement to produce the following    *;
*     results. The DO statement will now be based on a    *;
*     list of values instead of a value that is           *; 
*     incremented.                                        *;
***********************************************************;

data IncMPG;
    set sashelp.cars;
    MPG=mean(MPG_City, MPG_Highway);
run;

title 'Projected Fuel Efficiency with 3% Annual Increase';
proc print data=IncMPG;
    var Make Model Year MPG;
	format MPG 4.1;
run;
title;
