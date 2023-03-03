**************************************************;
*  LESSON 4, PRACTICE 3 SOLUTION                 *;
**************************************************;

proc format;	
    value decade
        '01Jan2000'd-'31Dec2009'd = '2000-2009'
        '01Jan2010'd-'31Dec2017'd = '2010-2017'
        '01Jan2018'd-'31Mar2018'd = '1st Quarter 2018'
        '01Apr2018'd-high = [mmddyy10.];
run;

title1 'Precipitation and Snowfall';
title2 'Note: Amounts shown in inches';
proc means data=pg2.np_weather maxdec=2 sum mean nonobs;
    where Prcp > 0 or Snow > 0;
    var Prcp Snow;
    class Date Name;
    format Date decade.;
run;
title;