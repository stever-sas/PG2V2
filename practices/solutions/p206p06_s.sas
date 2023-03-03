**************************************************;
*  LESSON 6, PRACTICE 6 SOLUTION                 *;
**************************************************;

data storm_workdays;
    set pg2.storm_summary;
    where year(StartDate)=2015 and Name is not missing;
    Duration=EndDate-StartDate+1;
    LostWork2015=0;
    do ThisDay = StartDate to EndDate;
       /* if the current day is not in 2015, exit the DO loop */
       if year(ThisDay) ne 2015 then leave;
       /* if the current day is not a workday, skip the rest 
          of the statements in the loop, and loop again*/
       if weekday(ThisDay) in (1,7) then continue;
       LostWork2015+1;
    end;
    keep Name Basin MaxWindMPH StartDate EndDate 
         Duration LostWork2015;
run;

title1 'Workdays Lost in 2015 due to Storms';
title2 '(where started in 2015 and ended in 2016)';
proc print data=storm_workdays;
    where year(StartDate) ne year(EndDate);
run;
title;