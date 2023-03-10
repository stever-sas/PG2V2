**************************************************;
*  LESSON 6, PRACTICE 1 SOLUTION                 *;
**************************************************;

/* b. */
data retirement;
    do Year = 1 to 6;
       Invest+10000;
       output;
    end;
run;

title1 'Retirement Account Balance per Year';
proc print data=retirement noobs;
    format Invest dollar12.2;
run;
title;

/* d. */
data retirement;
    do Year = 1 to 6;
       Invest+10000;
       do Quarter = 1 to 4;
          Invest+(Invest*(.075/4));
       end;
       output;
    end;
run;

title1 'Retirement Account Balance per Year';
proc print data=retirement noobs;
    format Invest dollar12.2;
run;
title;

/* f. */
data retirement;
    do Year = 1 to 6;
       Invest+10000;
       do Quarter = 1 to 4;
          Invest+(Invest*(.075/4));
       end;
       output;
    end;
    drop Quarter;
run;

title1 'Retirement Account Balance per Year';
proc print data=retirement noobs;
    format Invest dollar12.2;
run;
title;
