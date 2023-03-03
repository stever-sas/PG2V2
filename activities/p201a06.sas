***********************************************************;
*  Activity 1.06                                          *;
*  1) Add an explicit OUTPUT statement after each         *;
*     ProjectedSales assignment statement. Run the program*;
*     How many rows are in the output table?              *;
*  2) Comment the final OUTPUT statement and run the      *;
*     program again. ARe rows where Year=3 written to the *;
*     new table?                                          *;
***********************************************************;

data forecast;
	set sashelp.shoes;
	keep Region Product Subsidiary Year ProjectedSales;
	format ProjectedSales dollar10.;
    Year=1;
	ProjectedSales=Sales*1.05;
	Year=2;
	ProjectedSales=ProjectedSales*1.05;
	Year=3;
	ProjectedSales=ProjectedSales*1.05;
run;
