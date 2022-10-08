---------------------------------------------------------------------------------CLEAN---------------------------------------------------------------------------------
-- [Flight no#] column deleted.
alter table PlaneCrashes
drop column [Flight no#]

-- Time column deleted.
alter table PlaneCrashes
drop column Time

-- Null values change with 'Unknown' values.
update PlaneCrashes
set Aircraft = 'Unknown'
where Aircraft is null

update PlaneCrashes
set Operator = 'Unknown'
where Operator is null

update PlaneCrashes
set Registration = 'Unknown'
where Registration is null

update PlaneCrashes
set [Flight phase] = 'Unknown'
where [Flight phase] is null

update PlaneCrashes
set [Flight type] = 'Unknown'
where [Flight type] is null

update PlaneCrashes
set Survivors = 'Unknown'
where Survivors is null

update PlaneCrashes
set [Crash site] = 'Unknown'
where [Crash site] is null

update PlaneCrashes
set Schedule = 'Unknown'
where Schedule is null

update PlaneCrashes
set MSN = 'Unknown'
where MSN is null

update PlaneCrashes
set YOM = 'Unknown'
where YOM is null

update PlaneCrashes
set [Crash location] = 'Unknown'
where [Crash location] is null

update PlaneCrashes
set Country = 'Unknown'
where Country is null

update PlaneCrashes
set Region = 'Unknown'
where Region is null

update PlaneCrashes
set Circumstances = 'Unknown'
where Circumstances is null

update PlaneCrashes
set [Crash cause] = 'Unknown'
where [Crash cause] is null

-- 'NA' values change with 'Unknown' values.
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

-- Deleted insufficient datas in YOM column.
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

-- Deleted null values in type of float columns.
delete from PlaneCrashes
where [Crew on board] is null
or [Crew fatalities] is null
or [Pax on board] is null
or [PAX fatalities] is null
or [Other fatalities] is null
or [Total fatalities] is null

------------------------------------------------------------------------------ANALYSIS---------------------------------------------------------------------------------

