***********************************************************;
*  LESSON 1, PRACTICE 5                                   *;
***********************************************************;
*  b) Use SAS Help or online documentation to read about  *;
*     using SELECT and WHEN statements in the DATA step.  *;
*  c) Modify the Practice 3 program to use SELECT groups  *;
*     and WHEN statements.                                *;
***********************************************************;

/* Practice 3 using SELECT/WHEN */
data monument(drop=ParkType) park(drop=ParkType) other;
	set pg2.np_yearlytraffic;
	select (ParkType);
		when ('National Monument') output monument;
		when ('National Park') output park;
		otherwise output other;
	end;
	drop Region;
run;


