**************************************************;
*  LESSON 4, PRACTICE 6 SOLUTION                 *;
**************************************************;

/*step a*/
proc format cntlin=pg2.np_types_regions;
run;

title1 'Park Frequencies by Type';
proc freq data=pg2.np_summary;
    table Type / nocum;
    format Type $TypCode.;
run;
title;

/*step b*/
proc format cntlout=typfmtout;
    select $TypCode;
run;

/*step d*/
data typfmt_update;
    set typfmtout pg2.np_newcodes;
    keep FmtName Start Label;
    FmtName='$TypCode';
run;

/*step e*/
proc format cntlin=typfmt_update;
run;

/*step f*/
title1 'Park Frequencies by Type';
proc freq data=pg2.np_summary;
    table Type / nocum;
    format Type $TypCode.;
run;
title;
