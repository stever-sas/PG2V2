**************************************************;
*  LESSON 6, PRACTICE 2 SOLUTION                 *;
**************************************************;

/* d. */
data ForecastDayVisits;  
    set pg2.np_summary;
    where Reg='PW' and Type in ('NM','NP');
    ForecastDV=DayVisits;
    NextYear=year(today())+1;
    do Year = NextYear to NextYear+4;
       if Type='NM' then ForecastDV=ForecastDV*1.05;
       if Type='NP' then ForecastDV=ForecastDV*1.08;
       output;
    end;
    format ForecastDV comma12.;
    label ForecastDV='Forecasted Recreational Day Visitors';
    keep ParkName DayVisits ForecastDV Year;
run;

proc sort data=ForecastDayVisits;
    by ParkName;
run;

title 'Forecast of Recreational Day Visitors for Pacific West';
proc print data=ForecastDayVisits label;
run;
title;

/* e. */
data ForecastDayVisits;  
    set pg2.np_summary;
    where Reg='PW' and Type in ('NM','NP');
    ForecastDV=DayVisits;
    NextYear=year(today())+1;
    do Year = NextYear to NextYear+4;
       if Type='NM' then ForecastDV=ForecastDV*1.05;
       if Type='NP' then ForecastDV=ForecastDV*1.08;
       if Year=NextYear+4 then output;
    end;
    format ForecastDV comma12.;
    label ForecastDV='Forecasted Recreational Day Visitors';
    keep ParkName DayVisits ForecastDV Year;
run;

proc sort data=ForecastDayVisits;
    by ParkName;
run;

title 'Forecast of Recreational Day Visitors for Pacific West';
proc print data=ForecastDayVisits label;
run;
title;

