***********************************************************;
*  Using Conditional DO Loops                             *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    DATA output-table;                                   *;
*       SET input-table;                                  *;
*       . . .                                             *;
*       DO UNTIL | WHILE (expression);                    *;   
*          . . . repetitive code . . .                    *;
*          OUTPUT;                                        *;
*       END;                                              *;
*       DO index-column = start TO stop <BY increment>    *;
*          UNTIL | WHILE (expression);                    *;
*          . . . repetitive code . . .                    *;
*          OUTPUT;                                        *;
*       END;                                              *;
*       . . .                                             *;
*       OUTPUT;                                           *;
*    RUN;                                                 *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*  1) Open the PG2.SAVINGS2 table. This table contains a  *;
*     column named Savings that is the current value of   *;
*     each person's savings account. Notice that Linda's  *;
*     value is already greater than 3000.                 *;
*  2) Notice the DO UNTIL expression is Savings equal to  *;
*     3000. Run the program. Because Savings is never     *;
*     equal to 3000, the program is in an infinite loop.  *;
*     Stop the infinite DO loop from running.             *;
*     * In SAS Enterprise Guide, click the Stop toolbar   *;
*       button on the Program tab.                        *;
*     * In SAS Studio, click Cancel in the Running pop-up *;
*       window.                                           *;
*  3) Make the following modifications to the DATA step.  *;
*     a) Replace the equal sign with a greater than       *;
*        symbol.                                          *;
*     b) Add a sum statement inside the DO loop to create *;
*        a column named Month that will increment by 1    *;
*        for each loop.                                   *;
*     c) Before the DO loop add an assignment statement   *;
*        to reset Month to 0 each time a new row is read  *;
*        from the input table.                            *;
*  4) Run the program. Notice that even though Linda      *;
*     began with 3600 for Savings, the DO LOOP executed   *;
*     once.                                               *;
*  5) Change the DO UNTIL expression to DO WHILE so that  *;
*     the condition will be checked at the top of the     *;
*     loop. Run the program and verify Linda's Savings    *;
*     amount is 3600.                                     *;
***********************************************************;

/* Step 2 */
data MonthSavings;
    set pg2.savings2;
    do until (Savings=3000);
       Savings+Amount;
       Savings+(Savings*0.02/12);
    end;
    format Savings comma12.2;
run;

/* Step 3 */
data MonthSavings;
    set pg2.savings2;
    Month=0;
    do until (Savings>3000);
       Month+1;
       Savings+Amount;
       Savings+(Savings*0.02/12);
    end;
    format Savings comma12.2;
run;

/* Step 4 */
data MonthSavings;
    set pg2.savings2;
    Month=0;
    do while (Savings<3000);
       Month+1;
       Savings+Amount;
       Savings+(Savings*0.02/12);
    end;
    format Savings comma12.2;
run;
