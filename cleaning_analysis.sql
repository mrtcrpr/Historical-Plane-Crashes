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

/*
Also ı noticed inssuficient value in 1 row. 
This data contained YOM data from 1900. 
I searched this crash on the internet and ı found original values in this site.
https://aviation-safety.net/database/record.php?id=20080901-1
And YOM data that should be belong to 1990.
I fixed this situation.
*/
update PlaneCrashes
set YOM = '1990'
where YOM = '1900'

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

-- Let's dive in more deeper with our insights.

------------------------------------------------------------------------------INSIGHTS---------------------------------------------------------------------------------

/*
1. My first insight is make a more think about dates. 
Because dates are the key point our analysis.
*/

select 
DATEPART(year from date),
[Flight type],
COUNT([Flight type])
from PlaneCrashes
group by DATEPART(year from date), [Flight type]
order by count([Flight type]) desc
/*
It's more clear right now. We see 4 years top of our results.
It's 1945, 1944, 1943 and 1942. 
It was the time of World War II.
In this years have 4 military flighting and 1 training values. 
There are 1.209 different values for military flighting and 213 training values.
*/

/*
2. Let's talk about crash causes. If we understand crash cause problems, 
we can answer why the crashes did happen? 
Technical failure, weather, human factor or what. We need this answer.
*/

select 
[Crash cause],
count(*)
from PlaneCrashes
group by [Crash cause]
order by count(*) desc
/*
As you can see over here, there are 6 different problems meet us.
Unknown, human factor, technical failure, weather, sabotage and other causes.
As might be expected unknown causes are really much. They 10.051 rows.
We can't talk about unknown problems, because we don't have too much information about they.
Let's talk about human factors and technical failures.

Human factors have 9.145 different rows.
Technical failures have 5.964 different rows.

Let's more dive in for technical features.
*/

select 
Aircraft,
count(*)
from PlaneCrashes
where [Crash cause] = 'Technical failure'
group by Aircraft
order by count(*) desc

/*
We searched which aircraft made a crash for technical failures.
I share first 3 values right now. But ı will share all of them in my visualization.
First aircraft is Douglas C-47 Skytrain (DC-3) and it has 436 different crashes. This plane is type of military transport aircraft.
Second aircraft is Curtiss C-46 Commando and it has 200 different crashes. Also this plane too military transport aircraft.
Last plane is PZL-Mielec AN-2 and it has 180 different crashes. And this plane is type of agricultural plane.
*/

select 
operator,
count(*)
from PlaneCrashes
where Aircraft = 'Douglas C-47 Skytrain (DC-3)'
group by Operator
order by count(*) desc
/*
I would like to investigate a little more about the Douglas C-47 Skytrain (DC-3) aircraft, which is at the top of our list. 
Let's look at 3 operators that have this aircraft in their inventory.
First is United States Army Air Forces - USAAF and they have 414 aircrafts of this model. This operator changed it's name to USAF in September 26, 1947.
Second is United States Air Force - USAF and they have 225 aircrafts.
Last one is Royal Air Force - RAF and they have 185 aircrafts.
*/

/*
3. By combining the model years of the crashed planes with technical reasons, 
it can be measured how much accident the new or old generation planes cause. 
Thus, including which airline companies the planes belong to,
the insight may arise that these companies should replace their aircraft in the inventory with new generation aircraft.
*/

select 
Gen,
count(*)
from(
select 
Aircraft,
YOM,
case when YOM >= '1990' then 'New Generation' 
else 'Old Generation' end as Gen
from PlaneCrashes
where [Crash cause] = 'Technical failure' and YOM != 'Unknown') Generations
group by Gen
/*
I did a research and came to the conclusion that the airplanes produced after 1990 are the new generation. 
It would be correct to call the others the old generation.
According to the query I made, there are accident data for 209 new generation and 4692 old generation aircraft.
*/










