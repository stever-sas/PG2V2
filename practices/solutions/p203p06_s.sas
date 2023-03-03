**************************************************;
*  LESSON 3, PRACTICE 6 SOLUTION                 *;
**************************************************;

data parklookup;
    set pg2.np_unstructured_codes end=lastrow;
    length ParkCode $ 4 ParkName $ 83;
    ParkCode=scan(Column1, 2, '{}:,"()-');
    ParkName=scan(Column1, 4, '{}:,"()');
    retain MaxLength 0;
    NameLength=length(ParkName);
    MaxLength=max(NameLength,MaxLength);
    if lastrow=1 then putlog MaxLength=;
run;

proc print data=parklookup(obs=10);
run;

proc contents data=parklookup;
run;

