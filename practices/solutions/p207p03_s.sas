**************************************************;
*  LESSON 7, PRACTICE 3 SOLUTION                 *;
**************************************************;

data np_lodge_stack;
	set pg2.np_lodging_array;
	keep ParkName Year Stays;
	format Stays comma12.;	
	array Lodge[2015:2017] Lodge2015-Lodge2017;
	do Year=2015 to 2017;
		Stays=Lodge[Year];
		output;
	end;
run;

