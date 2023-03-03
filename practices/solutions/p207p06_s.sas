**************************************************;
*  LESSON 7, PRACTICE 6 SOLUTION                 *;
**************************************************;

proc sort data=pg2.weather_highlow out=sort_highlow;
	by Location;
run;

proc transpose data=sort_highlow out=lows let;
   by location;
   id Month;
run;
