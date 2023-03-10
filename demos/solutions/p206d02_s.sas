***********************************************************;
*  Using Iterative DO Loops                               *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    DATA output-table;                                   *;
*        SET input-table;                                 *;
*        . . .                                            *;
*        DO index-column = start TO stop <BY increment>;  *;
*           . . . repetitive code . . .                   *;
*           OUTPUT;                                       *;
*        END;                                             *;
*        . . .                                            *;
*        OUTPUT;                                          *;
*    RUN;                                                 *;
***********************************************************;
*  Demo                                                   *;
*  1) Open the PG2.SAVINGS table. Notice there are four   *;
*     rows representing different people. The Amount      *;
*     value is a monthly savings value.                   *;
*  2) Run the program and notice that four rows are       *;
*     created due to four rows being read from the input  *;
*     table. Also, notice how the Savings value keeps     *;
*     increasing for each row.                            *;
*  3) Fix the issue by adding an assignment statement     *;
*     before the DO loop to set the value of Savings to   *;
*     0. Run the program and notice the correct values    *;
*     for Savings.                                        *;
*  4) Add an outer DO loop to iterate through five years  *;
*     per each of the 12 months. Run the program and      *;
*     notice that you have one row per each person. Each  *;
*     row represents the savings after five years,        *;
*     assuming that savings are added each month. The     *;
*     value of Year is 6 and the value of Month is 13, an *;
*     increment beyond each stop value.                   *;
*  5) Add an OUTPUT statement to the bottom of the outer  *;
*     DO loop. Run the program and notice that you now    *;
*     have 5 rows per each person (a total of 20 rows).   *;
*     Each row represents the savings at each of the five *;
*     years.                                              *;
*  6) Move the OUPUT statement to the bottom of the inner *;
*     DO loop. Run the program and notice that you now    *;
*     have 60 rows per each person (a total of 240 rows). *;
*     Each row represents the savings at each year and    *;
*     month combination.                                  *;
***********************************************************;

/* Step 2 */
data YearSavings;
   set pg2.savings;
   do Month=1 to 12;
      Savings+Amount;
      Savings+(Savings*0.02/12);
   end;
   format Savings comma12.2;
run;

/* Step 3 */
data YearSavings;
   set pg2.savings;
   Savings=0;
   do Month=1 to 12;
      Savings+Amount;
      Savings+(Savings*0.02/12);
   end;
   format Savings comma12.2;
run;

/* Step 4 */
data YearSavings;
   set pg2.savings;
   Savings=0;
   do Year=1 to 5;
      do Month=1 to 12;
         Savings+Amount;
         Savings+(Savings*0.02/12);
      end;
   end;
   format Savings comma12.2;
run;

/* Step 5 */
data YearSavings;
   set pg2.savings;
   Savings=0;
   do Year=1 to 5;
      do Month=1 to 12;
         Savings+Amount;
         Savings+(Savings*0.02/12);
      end;
   output;
   end;
   format Savings comma12.2;
run;

/* Step 6 */
data YearSavings;
   set pg2.savings;
   Savings=0;
   do Year=1 to 5;
      do Month=1 to 12;
         Savings+Amount;
         Savings+(Savings*0.02/12);
		 output;
      end;
   end;
   format Savings comma12.2;
run;
