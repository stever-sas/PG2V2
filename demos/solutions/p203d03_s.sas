***********************************************************;
*  Using Character Functions to Extract Words             *;
*  from a String                                          *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    SCAN (string, n <, 'delimiters'>)                    *;
*    PROPCASE (string, <, 'delimiters'>)                  *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*  1) Notice that the DATA step creates the City and      *;
*     Prefecture columns by extracting the first or       *;
*     second word from Location. Highlight the step and   *;
*     run the selected code.                              *;
*  2) Examine row 8 in the output data. Notice that the   *;
*     city name should be MIYAKE-JIMA. However, the       *;
*     hyphen is a default delimiter, so MIYAKE is         *;
*     assigned to City and JIMA is assigned to            *;
*     Prefecture.                                         *;
*  3) In both SCAN functions, add a third argument to     *;
*     specify that the only delimiter is a comma.         *;
*     Highlight the step and run the selected code.       *;
*  4) Add an additional assignment statement to create a  *;
*     column named Country that reads the last word in    *;
*     Location.                                           *;
*  5) Use the PROPCASE function in the City assignment    *;
*     statement to capitalize the first letter of each    *;
*     word and convert the remaining letters to           *;
*     lowercase. Highlight the step and run the selected  *;
*     code.                                               *;
*  6) Examine row 8 again in the output data. Because the *;
*     hyphen is a delimiter, both Miyake and Jima are     *;
*     capitalized. The proper casing for this city name   *;
*     should be Miyake-jima. Use the optional second      *;
*     argument to specify that the only delimiter should  *;
*     be a space. Highlight the step and run the selected *;
*     code.                                               *;
***********************************************************;

/* Step 1 */
data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=scan(Location, 1);
	Prefecture=scan(Location, 2);
run;

/* Step 3 */
data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=scan(Location, 1, ',');
	Prefecture=scan(Location, 2, ',');
run;

/* Steps 4 andd 5 */
data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=propcase(scan(Location, 1, ','));
	Prefecture=scan(Location, 2, ',');
	Country=scan(Location, -1);
run;

/* Step 6 */
data weather_japan_clean;
	set pg2.weather_japan;
	Location=compbl(Location);
	City=propcase(scan(Location, 1, ','), ' ');
	Prefecture=scan(Location, 2, ',');
	Country=scan(Location, -1);
run;


