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

-- For creating a true insight we need to get answer 8 questions. This questions really helpful for our analysis.

/*
1. To find out in which years the accident occurred the most by dividing the dates into years.
*/

select 
count(*),
DATEPART(year from date)
from PlaneCrashes
group by DATEPART(year from date)
order by count(*) desc
-- According to the query, the year 1944 ranks first with 942 accidents.

select 
datepart(YEAR from date),
[Flight type],
count(*)
from PlaneCrashes
where datepart(YEAR from date) = '1944'
group by datepart(YEAR from date), [Flight type] 
-- When we go a little deeper this year, most of the crashed planes are military and bombing planes.

/*
2. To determine which seasons are suitable for accidents by dividing the dates into seasons.
*/

(select Q1,
Q2,
Q3,
Q4,
count(*)
from(
select 
case 
when DATEPART(MONTH from date) = 12 then 'Winter'
when DATEPART(MONTH from date) = 1 then 'Winter'
when DATEPART(MONTH from date) = 2 then 'Winter'
end as "Q1",
case
when DATEPART(MONTH from date) = 3 then 'Spring'
when DATEPART(MONTH from date) = 4 then 'Spring'
when DATEPART(MONTH from date) = 5 then 'Spring'
end as "Q2",
case
when DATEPART(MONTH from date) = 6 then 'Summer'
when DATEPART(MONTH from date) = 7 then 'Summer'
when DATEPART(MONTH from date) = 8 then 'Summer'
end as "Q3",
case
when DATEPART(MONTH from date) =  9 then 'Autumn'
when DATEPART(MONTH from date) = 10 then 'Autumn'
when DATEPART(MONTH from date) = 11 then 'Autumn'
end as "Q4"
from PlaneCrashes
) months
group by Q1,Q2, Q3, Q4)
/*
According to this query, almost all seasons are very close to each other in terms of the number of accidents. 
However, as can be expected, the weather conditions in winter can be more favorable for an accident. 
In the written query, we can see that there are more accidents in the winter season.
*/

/*
3. To find out which model year and which model aircraft are most susceptible to an accident.
*/

select 
Aircraft,
yom,
count(*)
from PlaneCrashes
group by Aircraft, yom
order by count(*) desc
-- According to the query, the aircraft with the most crashes was the Douglas C-47 Skytrain (DC-3) and the model year was 1944. There were 976 accidents.

/*
4. To find out at what time the accidents took place.
*/

select 
[Flight phase],
count(*)
from PlaneCrashes
group by [Flight phase]
/*
According to the query, the most common accident occurs during the flight. 
The next happens during the landing. The least number of accidents happen during parking.
*/

/*
5. To learn the causes of accidents. (crash cause)
*/

select 
[Crash cause],
count(*)
from PlaneCrashes
group by [Crash cause]
/*
While the majority of accidents are caused by unknown reasons, 
this list is followed by human factor, technical malfunctions, 
weather conditions, terrorism and other reasons.
*/

/*
6. To learn flight types.
*/

select 
[Flight type],
count(*)
from PlaneCrashes
group by [Flight type]
order by count(*) desc
/*
According to the query, accidents mostly happen on scheduled flights. This is followed by military and training flights.
*/

/*
7. To learn in which countries and on which continents the accidents took place.
*/

select 
Country,
count(*)
from PlaneCrashes
group by Country
order by count(*) desc
/*
According to the query, accidents mostly occur in the USA, followed by the UK and Russia. 
In addition, North America is the region with the highest number of accidents, followed by Europe and Asia.
*/

/*
8. To be able to calculate the conditions of the crew and passengers on the plane at the time of the accident.
*/

(select
sum([Total fatalities])
from PlaneCrashes)
/*
According to all records, a total of 158828 people lost their lives.
*/


























