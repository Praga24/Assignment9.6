--Load data

A = LOAD 'home/acadgild/Downloads/temperature.csv' USING PigStorage(',') AS (station:chararray,date:chararray,type:chararray,temperature:int);


--Pig script to find the minimum temperature observed in a given weather station in a particular year.

B = FILTER temperature BY type='TMIN';

C = GROUP B BY station;

D = FOREACH C GENERATE (group,MIN(B.temperature));

--Pig script to find the maximum temperature observed in a given weather station in a particular year.


B = FILTER temperature BY type='TMIN';

C = GROUP B BY station;

D = FOREACH C GENERATE (group,MAX(B.temperature));


--Pig script to find the number of readings given by each weather station according to the dataset.

B = GROUP temperature BY station;

C = FOREACH B GENERATE(group,COUNT(temperature.type));
