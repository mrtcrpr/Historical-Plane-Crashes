/*
Some lines had special characters. 
Using the Notepad++ application, these special characters have been updated using the UTF-8-BOM writing style, thus introducing special characters.
*/

-- This table has 24 columns and 28.536 rows.
select * from PlaneCrashes

/*
[Flight no#]
This column have 1 distinct value. It's 'NA'.
We don't need this column.
*/
select distinct [Flight no#] from PlaneCrashes

/*
Time
This column has a lot of null values. Also we don't need time values of this crashes for our analysis.
*/
select Time from PlaneCrashes
-- [Flight no#] and Time columns need to be deleted.

-- Also we don't want to null values. If rows are really critic for our analysis, we don't delete this rows. Just change with 'Unknown' text.
select * from PlaneCrashes
where Aircraft is null 
or Operator is null
or Registration is null
or [Flight phase] is null
or [Flight type] is null
or Survivors is null
or [Crash site] is null
or Schedule is null
or MSN is null
or YOM is null
or [Crash location] is null
or Country is null
or Region is null
or [Crew on board] is null
or [Crew fatalities] is null
or [Pax on board] is null
or [PAX fatalities] is null
or [Other fatalities] is null
or [Total fatalities] is null
or Circumstances is null
or [Crash cause] is null

-- Also there are 12.189 rows have 'NA' values. It don't need to be change but, ı think 'Unknown' is more clear than 'NA'. So ı will change.
select * from PlaneCrashes
where Aircraft = 'NA'
or Operator = 'NA'
or Registration = 'NA'
or [Flight phase] = 'NA'
or [Flight type] = 'NA'
or Survivors = 'NA'
or [Crash site] = 'NA'
or Schedule= 'NA'
or MSN = 'NA'
or YOM = 'NA'
or [Crash location] = 'NA'
or Country = 'NA'
or Region = 'NA'
or Circumstances = 'NA'
or [Crash cause] = 'NA'

/*
Some YOM rows have insufficient data. 
This YOM column has year of model of these planes. 
For this reason this planes model years wouldn't be ('21','31','943' .etc) 
*/
select * from PlaneCrashes
where yom = '20'
or yom = '21'
or yom = '22'
or yom = '23'
or yom = '19567'
or yom = '30'
or yom = '31'
or yom = '32'
or yom = '33'
or yom = '943'

/*
Final way of my pre cleaning step, ı searched null values in the type of float columns. 
There are 66 rows and ı don't have true values for this rows.
For this reason ı need to delete this rows.
*/
select * from PlaneCrashes
where [Crew on board] is null
or [Crew fatalities] is null
or [Pax on board] is null
or [PAX fatalities] is null
or [Other fatalities] is null
or [Total fatalities] is null

-- I finished pre cleaning phase.
