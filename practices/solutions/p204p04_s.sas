**************************************************;
*  LESSON 4, PRACTICE 4 SOLUTION                 *;
**************************************************;

data type_lookup;
    retain FmtName '$TypeFmt';
    set pg2.np_codeLookup(rename=(ParkCode=Start Type=Label));
    keep Start Label FmtName;
run;

proc format cntlin=work.type_lookup;
run;

title 'Traffic Statistics';
proc means data=pg2.np_monthlyTraffic maxdec=0 mean sum nonobs;
    var Count;
    class ParkCode Month;
    label ParkCode='Name';
    format ParkCode $TypeFmt.;
run;
title;
