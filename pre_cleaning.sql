/*
Some lines had special characters. 
Using the Notepad++ application, these special characters have been updated using the UTF-8-BOM writing style, thus introducing special characters.
*/

-- This table has 24 columns and 28.536 rows.
select * from PlaneCrashes
/*
There are 2 columns over here. 
These columns are hours and Flight No# columns. 
This columns have a lot of null values and NA text. 
We don't need this. This columns need to be delete.
*/

-- This 2 columns deleted with alter table query.
alter table PlaneCrashes
drop column hour

alter table PlaneCrashes
drop column [Flight no#]

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

-- Yukarıdaki verileri silmeyi unutma

-- Almost all of the columns have NA values. This need to be change with 'Unknown' value.  
update PlaneCrashes
set Aircraft = 'Unknown'
where Aircraft = 'NA'

update PlaneCrashes
set Operator = 'Unknown'
where Operator = 'NA'

update PlaneCrashes
set Registration = 'Unknown'
where Registration = 'NA'

update PlaneCrashes
set [Flight phase] = 'Unknown'
where [Flight phase] = 'NA'

update PlaneCrashes
set [Flight type] = 'Unknown'
where [Flight type] = 'NA'

update PlaneCrashes
set Survivors = 'Unknown'
where Survivors = 'NA'

update PlaneCrashes
set [Crash site] = 'Unknown'
where [Crash site] = 'NA'

update PlaneCrashes
set Schedule = 'Unknown'
where Schedule = 'NA'

update PlaneCrashes
set MSN = 'Unknown'
where MSN = 'NA'

update PlaneCrashes
set YOM = 'Unknown'
where YOM = 'NA'

update PlaneCrashes
set [Crash location] = 'Unknown'
where [Crash location] = 'NA'

update PlaneCrashes
set Country = 'Unknown'
where Country = 'NA'

update PlaneCrashes
set Region = 'Unknown'
where Region = 'NA'

update PlaneCrashes
set Circumstances = 'Unknown'
where Circumstances = 'NA'

update PlaneCrashes
set [Crash cause] = 'Unknown'
where [Crash cause] = 'NA'

-- Also there insufficient values in YOM column. This rows really important for our analysis. For this reason we can't delete this rows.
-- We use 'Unknown' text instead of this insufficient datas.

update PlaneCrashes
set yom = 'Unknown'
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























