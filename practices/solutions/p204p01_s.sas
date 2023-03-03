**************************************************;
*  LESSON 4, PRACTICE 1 SOLUTION                 *;
**************************************************;

proc format;
    value $highreg 'IM'='Intermountain'
                   'PW'='Pacific West'
                   'SE'='Southeast'
                   other='All Other Regions';
run;

title 'High Frequency Regions';
proc freq data=pg2.np_summary order=freq;
    tables Reg;
    label Reg='Region';
    format Reg $highreg.;
run;
title;
