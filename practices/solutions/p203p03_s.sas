**************************************************;
*  LESSON 3, PRACTICE 3 SOLUTION                 *;
**************************************************;

proc sort data=pg2.np_weather(keep=Name Code Date Snow)
		  out=winter2015_2016;
	where date between '01Oct15'd and '01Jun16'd and Snow > 0;
	by Code Date;
run;

data snowforecast;
	set winter2015_2016;
	retain FirstSnow;
	by Code;
	if first.Code then FirstSnow=Date;
	if last.Code then do;
		LastSnow=Date;
		WinterLengthWeeks=intck('week', FirstSnow, LastSnow, 'c');
		ProjectedFirstSnow=intnx('year', FirstSnow, 1, 'same');
		output;
	end;
	format FirstSnow LastSnow ProjectedFirstSnow date7.;
	drop Snow Date;
run;
