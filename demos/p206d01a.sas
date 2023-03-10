***********************************************************;
*  Executing an Iterative DO Loop                         *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    DATA output-table;                                   *;
*        . . .                                            *;
*        DO index-column = start TO stop <BY increment>;  *;
*           . . . repetitive code . . .                   *;
*        END;                                             *;
*        . . .                                            *;
*    RUN;                                                 *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*  1) Run the program and view the Forecast output table. *;
*     Notice that there are three rows (Year 1, 2, and 3) *;
*     for each combination of Region, Product, and        *;
*     Subsidiary.                                         *;
*  2) Return to the Program tab and click the DATA step   *;
*     markers for debugging button to enable debugging in *;
*     the program if it is not already enabled. Click the *;
*     Debugger icon next to the DATA statement. The DATA  *;
*     Step Debugger window appears.                       *;
*  3) Click the Step execution to next line button to     *;
*     execute the highlighted SET statement.              *;
*  4) Click the button again to execute the highlighted   *;
*     DO statement. Notice that the Year value has been   *;
*     set to 1.                                           *;
*  5) Click the button three times to execute the         *;
*     statements inside the DO loop and the END           *;
*     statement. Notice that the Year value has been      *;
*     incremented to 2 and that processing returns to the *;
*     inside of the DO loop.                              *;
*  6) Continue to click the button to execute the         *;
*     highlighted statements inside the DO loop. Observe  *;
*     the changing of values in the PDV.                  *;
*  7) At the end of third iteration of the DO loop,       *;
*     notice that the Year value is incremented to 4 and  *;
*     that processing does not return to the inside of    *;
*     the DO loop.                                        *;
*  8) Close the DATA Step Debugger.                       *;
***********************************************************;

data forecast;
    set sashelp.shoes(rename=(Sales=ProjectedSales));
    do Year = 1 to 3;
       ProjectedSales=ProjectedSales*1.05;
       output;
    end;
    keep Region Product Subsidiary Year ProjectedSales;
    format ProjectedSales dollar10.;
run;
