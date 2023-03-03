***********************************************************;
*  Shifting Date Values                                   *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    INTNX ('interval', start, increment <, 'alignment'>) *;
***********************************************************;
 
***********************************************************;
*  Demo                                                   *;
*  1) Notice that the AssessmentDate column is created by *;
*     using the INTNX function to shift each Date value.  *;
*     Highlight the DATA step and run the selected code.  *;
*     Notice that each Date value has been shifted to the *;
*     first day of the same month.                        *;
*  2) To see the impact of the various arguments in the   *;
*     INTNX function, modify the arguments as directed.   *;
*     Highlight the DATA step, run the selected code, and *;
*     examine the results after each modification.        *;
*     a) Change the increment value to 2.                 *;
*     b) Change the increment value to -1. Add 'end' as   *;
*        the optional fourth argument to specify          *;
*        alignment.                                       *;
*     c) Change the alignment argument to 'middle'.       *;
*  3) Write an assignment statement to create a new       *;
*     column named Anniversary that is the date of the    *;
*     10-year anniversary for each storm. Add 'same' as   *;
*     the optional fourth argument to specify alignment.  *;
*     Keep the new column in the output table and use the *;
*     DATE9. format to display the values.                *;
***********************************************************;

/* Step 1 */
data storm_damage2;
	set pg2.storm_damage;
	keep Event Date AssessmentDate;
	AssessmentDate=intnx('month', Date, 0);
    format Date AssessmentDate date9.;
run;

/* Step 2 */
data storm_damage2;
	set pg2.storm_damage;
	keep Event Date AssessmentDate:;
	AssessmentDate=intnx('month', Date, 0);
	AssessmentDate_A=intnx('month', Date, 2);
	AssessmentDate_B=intnx('month', Date, -1, 'end');
	AssessmentDate_C=intnx('month', Date, -1, 'middle');
    format Date AssessmentDate: date9.;
run;

/* Step 3 */
data storm_damage2;
    set pg2.storm_damage;
    keep Event Date AssessmentDate: Anniversary;
    AssessmentDate=intnx('month', Date, -1, 'middle');
    Anniversary=intnx('year', Date, 10, 'same');
    format Date AssessmentDate: Anniversary date9.;
run;
