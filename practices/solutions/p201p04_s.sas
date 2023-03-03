**************************************************;
*  LESSON 1, PRACTICE 4 SOLUTION                 *;
**************************************************;

data camping(keep=ParkName Month DayVisits CampTotal)
	 lodging(keep=ParkName Month DayVisits LodgingOther);
	set pg2.np_2017;
	CampTotal=sum(of Camping:);
	if CampTotal > 0 then output camping;
	if LodgingOther > 0 then output lodging;
	format CampTotal comma15.;
run;
