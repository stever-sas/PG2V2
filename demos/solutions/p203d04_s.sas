***********************************************************;
*  Using the INPUT and PUT Functions to Convert           *;
*  Column Types                                           *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    DATA output-table;                                   *;
*        SET input-table(RENAME=(current-col=new-col));   *;
*        ...                                              *;
*        column1 = INPUT (source, informat);              *;
*        column2 = PUT (source, format);                  *;
*        ...                                              *;
*    RUN;                                                 *;
***********************************************************;

data work.stocks2;
   set pg2.stocks2;
   Date2=input(Date,date9.);
   Volume=input(Volume,comma12.);
run;

data work.stocks2;
   set pg2.stocks2(rename=(Volume=VolumeC));
   Date2=input(Date,date9.);
   Volume=input(VolumeC,comma12.);
   drop VolumeC;
run;

data work.stocks2;
   set pg2.stocks2(rename=(Volume=VolumeC Date=DateC));
   Volume=input(VolumeC,comma12.);
   Date=input(DateC,date9.);
   Day=put(Date,downame3.);
   drop VolumeC DateC;
run;

***********************************************************;
*  Demo                                                   *;
*  1) Open the PG2.WEATHER_ATLANTA table and notice the   *;
*     following:                                          *;
*     * ZipCode is a numeric column.                      *;
*     * Date and Precip are character columns. A Precip   *;
*     value of T means that a trace value was recorded,   *;
*     which means a very small amount of precipitation    *;
*     that results in no measurable accumulation.         *;
*  2) Run the first DATA step.                            *;
*  3) View the SAS log. SAS attempts to convert the       *;
*     character Precip value to a numeric value using the *;
*     w. informat. SAS is successful when the character   *;
*     value is a legitimate numeric value such as .27.    *;
*     SAS is unsuccessful when the value is equal to a    *;
*     non-numeric value such as T. A value of T is        *;
*     converted to a missing numeric value.               *;
*  4) View the output table. Notice that TotalPrecip was  *;
*     accurately created for each row. The sum statement  *;
*     ignores the missing values for the Precip values of *;
*     T.                                                  *;
*  5) Add to the DATA step to create a new column named   *;
*     PrecipNum. Use PrecipNum in the assignment          *;
*     statement instead of Precip. Drop the Precip        *;
*     column.                                             *;
*  6) Run the DATA step. Notice that the SAS log no       *;
*     longer contains a note about character values being *;
*     converted to numeric values and no longer contains  *;
*     notes about invalid numeric data for Precip='T'.    *;
*  7) Add to the DATA step to create a numeric column     *;
*     Date from the character column Date. Also, format   *;
*     the numeric Date and drop the character Date.       *;
*  8) Run the DATA step. Confirm that you have a numeric  *;
*     precipitation column and a numeric date column.     *;
***********************************************************;

/*Step 2-4*/
data atl_precip;
	set pg2.weather_atlanta;
	where AirportCode='ATL';
	drop AirportCode City Temp: ZipCode;
	TotalPrecip+Precip;
run;

/*Step 5-6*/
data atl_precip;
	set pg2.weather_atlanta;
	where AirportCode='ATL';
	drop AirportCode City Temp: ZipCode Precip;
	if Precip ne 'T' then PrecipNum=input(Precip,6.);
	else PrecipNum=0;
	TotalPrecip+PrecipNum;
run;

/*Step 7-8*/
data atl_precip;
	set pg2.weather_atlanta(rename=(Date=CharDate));
	where AirportCode='ATL';
	drop AirportCode City Temp: ZipCode Precip CharDate;
	if Precip ne 'T' then PrecipNum=input(Precip,6.);
	else PrecipNum=0;
	TotalPrecip+PrecipNum;
	Date=input(CharDate,mmddyy10.);
	format Date date9.;
run;

***********************************************************;
*  9) Run the second DATA step and notice that            *;
*     CityStateZip was accurately created for each row.   *;
*     The CAT functions automatically convert numeric     *;
*     values to character values and remove leading       *;
*     blanks in the converted value. SAS does not write a *;
*     note to the log when values are converted with the  *;
*     CAT functions.                                      *;
* 10) Add to the DATA step to create a character column   *;
*     ZipCodeLast2 that contains the last two digits of   *;
*     the numeric column ZipCode.                         *;
* 11) View the SAS log. SAS converts the numeric ZipCode  *;
*     value to a character value.                         *;
* 12) View the output table. Notice that ZipCodeLast2 is  *;
*     not displaying the last two digits of the ZIP code. *;
*     When SAS automatically converts a numeric value to  *;
*     a character value, the BEST12. format is used, and  *;
*     the resulting character value is right-aligned. The *;
*     numeric value of 30320 becomes the character value  *;
*     of seven leading spaces followed by 30320.          *;
* 13) Modify the first argument of the SUBSTR function to *;
*     explicitly convert the numeric ZipCode value to a   *;
*     character value.                                    *;
* 14) View the output table. Notice that ZipCodeLast2 now *;
*     displays the last two digits of the ZIP code.       *;
***********************************************************;

/*Step 9*/
data atl_precip;
	set pg2.weather_atlanta;
	CityStateZip=catx(' ',City,'GA',ZipCode);
run;

/*Step 10-12*/
data atl_precip;
	set pg2.weather_atlanta;
	CityStateZip=catx(' ',City,'GA',ZipCode);
	ZipCodeLast2=substr(ZipCode, 4, 2);
run;

/*Step 13-14*/
data atl_precip;
	set pg2.weather_atlanta;
	CityStateZip=catx(' ',City,'GA',ZipCode);
	ZipCodeLast2=substr(put(ZipCode, z5.), 4, 2);
run;

