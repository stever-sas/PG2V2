***********************************************************;
*  Activity 3.02                                          *;
*  1) Examine the program and notice that all quiz scores *;
*     for two students are changed to missing values.     *;
*     Highlight the first DATA step and submit the        *;
*     selected code.                                      *;
*  2) In a web browser, access SAS Help at                *;
*     http://support.sas.com/documentation. In the Syntax *;
*     Shortcuts section, click the Programming: SAS 9.4   *;
*     and Viya link.                                      *;
*  3) In the Syntax - Quick Links section, click CALL     *;
*     Routines. Use the documentation to read about the   *;
*     CALL MISSING routine.                               *;
*  4) Simplify the second DATA step by using CALL MISSING *;
*     to assign missing values for the two students' quiz *;
*     scores. Run the step.                               *;
***********************************************************;

/* Step 1 */
data quiz_report;
    set pg2.class_quiz;
	if Name in("Barbara", "James") then do;
		Quiz1=.;
		Quiz2=.;
		Quiz3=.;
		Quiz4=.;
		Quiz5=.;
	end;
run;

/* Step 4 */
data quiz_report;
    set pg2.class_quiz;
	if Name in("Barbara", "James") then call missing(/*provide arguments*/);
run;

