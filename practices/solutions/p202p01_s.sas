**************************************************;
*  LESSON 2, PRACTICE 1 SOLUTION                 *;
**************************************************;

data totalTraffic;
	set pg2.np_yearlyTraffic;
	retain totTraffic 0;
	totTraffic=totTraffic+Count;
	keep ParkName Location Count totTraffic; 
	format totTraffic comma12.;
run;

/*OR*/

data totalTraffic;
	set pg2.np_yearlyTraffic;
    totTraffic+Count;
	keep ParkName Location Count totTraffic; 
	format totTraffic comma12.;
run;
