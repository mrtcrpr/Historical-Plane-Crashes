---------------------------------------------------------------------------------CLEAN---------------------------------------------------------------------------------
-- [Flight no#] column deleted.
alter table Plane
drop column [Flight no#]

-- Time column deleted.
alter table Plane
drop column Time

-- Null values change with 'Unknown' values.
update Plane
set Aircraft = 'Unknown'
where Aircraft is null

update Plane
set Operator = 'Unknown'
where Operator is null

update Plane
set Registration = 'Unknown'
where Registration is null

update Plane
set [Flight phase] = 'Unknown'
where [Flight phase] is null

update Plane
set [Flight type] = 'Unknown'
where [Flight type] is null

update Plane
set Survivors = 'Unknown'
where Survivors is null

update Plane
set [Crash site] = 'Unknown'
where [Crash site] is null

update Plane
set Schedule = 'Unknown'
where Schedule is null

update Plane
set MSN = 'Unknown'
where MSN is null

update Plane
set YOM = 'Unknown'
where YOM is null

update Plane
set [Crash location] = 'Unknown'
where [Crash location] is null

update Plane
set Country = 'Unknown'
where Country is null

update Plane
set Region = 'Unknown'
where Region is null

update Plane
set Circumstances = 'Unknown'
where Circumstances is null

update Plane
set [Crash cause] = 'Unknown'
where [Crash cause] is null

-- 'NA' values change with 'Unknown' values.
update Plane
set Aircraft = 'Unknown'
where Aircraft = 'NA'

update Plane
set Operator = 'Unknown'
where Operator = 'NA'

update Plane
set Registration = 'Unknown'
where Registration = 'NA'

update Plane
set [Flight phase] = 'Unknown'
where [Flight phase] = 'NA'

update Plane
set [Flight type] = 'Unknown'
where [Flight type] = 'NA'

update Plane
set Survivors = 'Unknown'
where Survivors = 'NA'

update Plane
set [Crash site] = 'Unknown'
where [Crash site] = 'NA'

update Plane
set Schedule = 'Unknown'
where Schedule = 'NA'

update Plane
set MSN = 'Unknown'
where MSN = 'NA'

update Plane
set YOM = 'Unknown'
where YOM = 'NA'

update Plane
set [Crash location] = 'Unknown'
where [Crash location] = 'NA'

update Plane
set Country = 'Unknown'
where Country = 'NA'

update Plane
set Region = 'Unknown'
where Region = 'NA'

update Plane
set Circumstances = 'Unknown'
where Circumstances = 'NA'

update Plane
set [Crash cause] = 'Unknown'
where [Crash cause] = 'NA'

-- Deleted insufficient datas in YOM column.
update Plane
set yom = 'Unknown'
where yom = '0'
or yom = '1'
or yom = '2'
or yom = '3'
or yom = '4'
or yom = '5'
or yom = '6'
or yom = '7'
or yom = '8'
or yom = '9'
or yom = '10'
or yom = '11'
or yom = '12'
or yom = '13'
or yom = '14'
or yom = '15'
or yom = '16'
or yom = '17'
or yom = '18'
or yom = '19'
or yom = '20'
or yom = '21'
or yom = '22'
or yom = '23'
or yom = '24'
or yom = '25'
or yom = '26'
or yom = '27'
or yom = '28'
or yom = '29'
or yom = '30'
or yom = '31'
or yom = '32'
or yom = '33'
or yom = '170'
or yom = '254'
or yom = '943'
or yom = '1645'
or yom = '1651'
or yom = '12928'
or yom = '14949'
or yom = '19567'

/*
Updated invalid Country values. 
Also there are two issues. 
1. It is 'Unknown' result. When we look at Schedule column. The schedule is (Kaneohe Bay - Kaneohe Bay).
I searched on internet, i found 'Kaneohe Bay' is the bay in Hawaii. 
Hawaii is state of United States of America. For this reason i need to set Country = 'United States of America'

2. Also we have 'World' values in Country column. This values will not help us. We need to delete this rows. 
*/
update Plane
set Country = 'United Kingdom'
where Country like '%Ascension Island%'

update Plane
set Country = 'Mauritius'
where Country like '%Chagos Archipelago%'

update Plane
set Country = 'Comoros'
where Country like '%Comoros Islands%'

update Plane
set Country = 'Netherlands'
where Country like '%Dutch Antilles%'

update Plane
set Country = 'Fiji'
where Country like '%Fiji Islands%'

update Plane
set Country = 'French Guiana'
where Country like '%French Guyana%'

update Plane
set Country = 'Guam'
where Country like '%Guam Island%'

update Plane
set Country = 'Maldives'
where Country like '%Maldivian Islands%'

update Plane
set Country = 'Samoa'
where Country like '%Samoa Islands%'

update Plane
set Country = 'United States of America'
where Country like '%Unknown%'

delete from Plane
where Country like '%World%'

-- Deleted null values in type of float columns.
delete from Plane
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
update Plane
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
from Plane
group by DATEPART(year from date)
order by count(*) desc
-- According to the query, the year 1944 ranks first with 942 accidents.

select 
datepart(YEAR from date),
[Flight type],
count(*)
from Plane
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
from Plane
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
from Plane
group by Aircraft, yom
order by count(*) desc
-- According to the query, the aircraft with the most crashes was the Douglas C-47 Skytrain (DC-3) and the model year was 1944. There were 976 accidents.

/*
4. To find out at what time the accidents took place.
*/

select 
[Flight phase],
count(*)
from Plane
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
from Plane
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
from Plane
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
from Plane
group by Country
order by count(*) desc

select 
Region,
count(*)
from Plane
group by Region
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
from Plane)
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
from Plane
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
from Plane
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
from Plane
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
from Plane
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

select count(*)
from Plane
where [Crash cause] = 'Technical failure'
/*
As you can see that there are 5.964 different crashes for technical failure reason.
*/

select 
Operator,
Gen,
count(*) as Amount
from
(select 
Operator,
case when YOM >= '1990' Then 'New' else 'Old' end as Gen
from Plane
where [Crash cause] = 'Technical failure' and YOM != 'Unknown') Generations
group by Operator, Gen
order by count(*) desc
/*
I did a research and came to the conclusion that the airplanes produced after 1990 are the new generation. 
It would be correct to call the others the old generation.
According to the query I made, there are accident data for 209 new generation and 4692 old generation aircraft.
Looking at the top 3 data:
United States Air Force - USAF Old 349
Aeroflot - Russian International Airlines Old 258
Royal Air Force - RAF Old 199
*/

/*
4. Another phase of our analysis is the question of when accidents occur according to flight types. 
Thus, some uncertainties related to flight safety can be eliminated.
*/

select top 5
[Flight type],
count(*)
from Plane
group by [Flight type]
order by count(*) desc

/*
When we look at the top 5 flight types,
Scheduled Revenue Flight  -> 6.026
Military  -> 4.633
Training  -> 3.290
Cargo  -> 2.806
Private  -> 2.340
total accident meets us.
*/

select
[Flight type],
[Flight phase],
count([Flight phase])
from Plane 
where [Flight type] = 'Scheduled Revenue Flight' 
or [Flight type] = 'Military' 
or [Flight type] = 'Training'
or [Flight type] = 'Cargo'
or [Flight type] = 'Private'
group by [Flight type], [Flight phase]
order by count([Flight phase]) desc
/*
When we dig a little deeper into our analysis, the times in which the accidents result are as in the comments.
Scheduled Revenue Flight -> Landing (descent or approach) -> 2.632 Crashes
Military -> Flight -> 2.059 Crashes
Training -> Flight -> 1.608 Crashes
Cargo -> Landing (descent or approach) -> 1.260
Private -> Flight -> 901
*/

select 
[Flight type],
[Crash site],
COUNT(*)
from Plane
group by [Flight type], [Crash site]
order by count(*) desc
/*
When we deepen our analysis, the region where the accident occurred in all of these flight types is the Airport (less than 10 km from airport).
Scheduled Revenue Flight -> Airport (less than 10 km from airport) -> 3.156
Military -> Airport (less than 10 km from airport) -> 2.047
Training -> Airport (less than 10 km from airport) -> 1.788
Cargo -> Airport (less than 10 km from airport) -> 1.695
Private -> Airport (less than 10 km from airport) -> 1.128
*/

--I finished insights. Let's visualize this insights and analysis.
