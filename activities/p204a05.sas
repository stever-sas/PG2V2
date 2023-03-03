***********************************************************;
*  Activity 4.05                                          *;
*  1) In the PROC FORMAT statement, add the LIBRARY=      *;
*     option to save the formats to the PG2.FORMATS       *;
*     catalog.                                            *;
*  2) Run the PROC FORMAT step and verify in the log that *;
*     the two formats were created in a permanent         *;
*     location.                                           *;
*  3) Before the PROC PRINT step, add an OPTIONS          *;
*     statement so that SAS can find the two permanent    *;
*     formats.                                            *;
*         options fmtsearch=(pg2.formats);                *;
*  4) Run the OPTIONS statement and the PROC PRINT step.  *;
*     Are the Registration and Height values formatted?   *;
***********************************************************;

proc format /*add a LIBRARY= option*/ ;
    value $reg 'C' = 'Complete'
               'I' = 'Incomplete'                             
             other = 'Miscoded';
    value hght low-<58  = 'Below Average'
                58-60   = 'Average'
               60<-high = 'Above Average';
run;

*add an OPTIONS statement;

proc print data=pg2.class_birthdate noobs;
    where Age=12;
    var Name Registration Height;
    format Registration $reg. Height hght.;
run;
