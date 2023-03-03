***********************************************************;
*  LESSON 5, PRACTICE 1 SOLUTION                          *;
***********************************************************;

data work.np_combine;
    set pg2.np_2015 pg2.np_2016;
    CampTotal=sum(of Camping:);
    where Month in(6, 7, 8);
    format CampTotal comma15.;
    drop Camping:;
run;


