**************************************************;
*  LESSON 6, PRACTICE 3 SOLUTION                 *;
**************************************************;

/* Step b */
data IncMPG;
    set sashelp.cars;
    MPG=mean(MPG_City, MPG_Highway);
    do Year=1 to 5;
        MPG=MPG*1.03;
        output;
    end;
run;

title 'Projected Fuel Efficiency with 3% Annual Increase';
proc print data=IncMPG;
    var Make Model Year MPG;
	format MPG 4.1;
run;
title;

/* Step c */
data IncMPG;
    set sashelp.cars;
    MPG=mean(MPG_City, MPG_Highway);
    do Year='Year 1', 'Year 2', 'Year 3', 'Year 4', 'Year 5';
        MPG=MPG*1.03;
        output;
    end;
run;

title 'Projected Fuel Efficiency with 3% Annual Increase';
proc print data=IncMPG;
    var Make Model Year MPG;
	format MPG 4.1;
run;
title;
