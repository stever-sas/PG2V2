**************************************************;
*  LESSON 5, PRACTICE 5 SOLUTION                 *;
**************************************************;

proc sort data=pg2.np_codelookup out=sortnames(keep=ParkName ParkCode);
	by ParkName;
run;

proc sort data=pg2.np_final out=sortfinal;
	by ParkName;
run;

data highuse(keep=ParkCode ParkName);
	merge sortfinal sortnames;
	by ParkName;
	if DayVisits ge 5000000;
run;

proc sort data=pg2.np_species
	  	  out=birds(keep=ParkCode Species_ID Scientific_Name Common_Names);
	by ParkCode Species_ID;
	where Category='Bird' and Abundance='Common';
run;

proc sort data=highuse;
	by ParkCode;
run;

data work.birds_largepark;
	merge birds highuse(in=inPark);
	by ParkCode;
	if inPark=1;
run;
