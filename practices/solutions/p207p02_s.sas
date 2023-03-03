**************************************************;
*  LESSON 7, PRACTICE 2 SOLUTION                 *;
**************************************************;

data work.camping_wide;
	set pg2.np_2016Camping;
	by ParkName;
	keep ParkName Tent RV Backcountry;
	format Tent RV Backcountry comma12.;
	retain ParkName Tent RV Backcountry;
	if CampType='Tent' then Tent=CampCount;
	else if CampType='RV' then RV=CampCount;
	else if CampType='Backcountry' then Backcountry=CampCount;
	if last.ParkName;
run;
