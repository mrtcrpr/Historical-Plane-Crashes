---------------------------------------------------------------------------------CLEAN---------------------------------------------------------------------------------
-- [Flight no#] column deleted.
ALTER TABLE
  Plane DROP COLUMN [Flight no#] 
  
-- Time column deleted.
ALTER TABLE
  Plane DROP COLUMN Time 
  
-- Null values change with 'Unknown' values.
UPDATE
  Plane
SET
  Aircraft = 'Unknown'
WHERE
  Aircraft IS NULL
  
UPDATE
  Plane
SET
  Operator = 'Unknown'
WHERE
  Operator IS NULL
  
UPDATE
  Plane
SET
  Registration = 'Unknown'
WHERE
  Registration IS NULL
  
UPDATE
  Plane
SET
  [Flight phase] = 'Unknown'
WHERE
  [Flight phase] IS NULL
  
UPDATE
  Plane
SET
  [Flight type] = 'Unknown'
WHERE
  [Flight type] IS NULL
  
UPDATE
  Plane
SET
  Survivors = 'Unknown'
WHERE
  Survivors IS NULL
  
UPDATE
  Plane
SET
  [Crash site] = 'Unknown'
WHERE
  [Crash site] IS NULL
  
UPDATE
  Plane
SET
  Schedule = 'Unknown'
WHERE
  Schedule IS NULL
  
UPDATE
  Plane
SET
  MSN = 'Unknown'
WHERE
  MSN IS NULL
  
UPDATE
  Plane
SET
  YOM = 'Unknown'
WHERE
  YOM IS NULL
  
UPDATE
  Plane
SET
  [Crash location] = 'Unknown'
WHERE
  [Crash location] IS NULL
  
UPDATE
  Plane
SET
  Country = 'Unknown'
WHERE
  Country IS NULL
  
UPDATE
  Plane
SET
  Region = 'Unknown'
WHERE
  Region IS NULL
  
UPDATE
  Plane
SET
  Circumstances = 'Unknown'
WHERE
  Circumstances IS NULL
  
UPDATE
  Plane
SET
  [Crash cause] = 'Unknown'
WHERE
  [Crash cause] IS NULL 
  
-- 'NA' values change with 'Unknown' values.
UPDATE
  Plane
SET
  Aircraft = 'Unknown'
WHERE
  Aircraft = 'NA'
  
UPDATE
  Plane
SET
  Operator = 'Unknown'
WHERE
  Operator = 'NA'
  
UPDATE
  Plane
SET
  Registration = 'Unknown'
WHERE
  Registration = 'NA'
  
UPDATE
  Plane
SET
  [Flight phase] = 'Unknown'
WHERE
  [Flight phase] = 'NA'
  
UPDATE
  Plane
SET
  [Flight type] = 'Unknown'
WHERE
  [Flight type] = 'NA'
  
UPDATE
  Plane
SET
  Survivors = 'Unknown'
WHERE
  Survivors = 'NA'
  
UPDATE
  Plane
SET
  [Crash site] = 'Unknown'
WHERE
  [Crash site] = 'NA'
  
UPDATE
  Plane
SET
  Schedule = 'Unknown'
WHERE
  Schedule = 'NA'
  
UPDATE
  Plane
SET
  MSN = 'Unknown'
WHERE
  MSN = 'NA'
  
UPDATE
  Plane
SET
  YOM = 'Unknown'
WHERE
  YOM = 'NA'
  
UPDATE
  Plane
SET
  [Crash location] = 'Unknown'
WHERE
  [Crash location] = 'NA'
  
UPDATE
  Plane
SET
  Country = 'Unknown'
WHERE
  Country = 'NA'
  
UPDATE
  Plane
SET
  Region = 'Unknown'
WHERE
  Region = 'NA'
  
UPDATE
  Plane
SET
  Circumstances = 'Unknown'
WHERE
  Circumstances = 'NA'
  
UPDATE
  Plane
SET
  [Crash cause] = 'Unknown'
WHERE
  [Crash cause] = 'NA' 
  
-- Deleted insufficient datas in YOM column.
UPDATE
  Plane
SET
  yom = 'Unknown'
WHERE
  yom = '0'
  OR yom = '1'
  OR yom = '2'
  OR yom = '3'
  OR yom = '4'
  OR yom = '5'
  OR yom = '6'
  OR yom = '7'
  OR yom = '8'
  OR yom = '9'
  OR yom = '10'
  OR yom = '11'
  OR yom = '12'
  OR yom = '13'
  OR yom = '14'
  OR yom = '15'
  OR yom = '16'
  OR yom = '17'
  OR yom = '18'
  OR yom = '19'
  OR yom = '20'
  OR yom = '21'
  OR yom = '22'
  OR yom = '23'
  OR yom = '24'
  OR yom = '25'
  OR yom = '26'
  OR yom = '27'
  OR yom = '28'
  OR yom = '29'
  OR yom = '30'
  OR yom = '31'
  OR yom = '32'
  OR yom = '33'
  OR yom = '170'
  OR yom = '254'
  OR yom = '943'
  OR yom = '1645'
  OR yom = '1651'
  OR yom = '12928'
  OR yom = '14949'
  OR yom = '19567'
  
  /*
   Updated invalid Country values. 
   Also there are two issues. 
   1. It is 'Unknown' result. When we look at Schedule column. The schedule is (Kaneohe Bay - Kaneohe Bay).
   I searched on internet, I found 'Kaneohe Bay' is the bay in Hawaii. 
   Hawaii is state of United States of America. For this reason I need to set Country = 'United States of America'
   2. Also we have 'World' values in Country column. This values will not help us. We need to delete this rows. 
   */
UPDATE
  Plane
SET
  Country = 'United Kingdom'
WHERE
  Country LIKE '%Ascension Island%'
  
UPDATE
  Plane
SET
  Country = 'Mauritius'
WHERE
  Country LIKE '%Chagos Archipelago%'
  
UPDATE
  Plane
SET
  Country = 'Comoros'
WHERE
  Country LIKE '%Comoros Islands%'
  
UPDATE
  Plane
SET
  Country = 'Netherlands'
WHERE
  Country LIKE '%Dutch Antilles%'
  
UPDATE
  Plane
SET
  Country = 'Fiji'
WHERE
  Country LIKE '%Fiji Islands%'
  
UPDATE
  Plane
SET
  Country = 'French Guiana'
WHERE
  Country LIKE '%French Guyana%'
  
UPDATE
  Plane
SET
  Country = 'Guam'
WHERE
  Country LIKE '%Guam Island%'
  
UPDATE
  Plane
SET
  Country = 'Maldives'
WHERE
  Country LIKE '%Maldivian Islands%'
  
UPDATE
  Plane
SET
  Country = 'Samoa'
WHERE
  Country LIKE '%Samoa Islands%'
  
-- Along with the Country value, the Region value must also change. (Kaneohe Bay)
UPDATE
  Plane
SET
  Country = 'United States of America'
WHERE
  Country LIKE '%Unknown%'
  
UPDATE
  plane
SET
  Region = 'North America'
WHERE 
  Country = 'United States of America'
  
DELETE FROM
  Plane
WHERE
  Country LIKE '%World%' 
  
-- Deleted null values in type of float columns.
DELETE FROM
  Plane
WHERE
  [Crew on board] IS NULL
  OR [Crew fatalities] IS NULL
  OR [Pax on board] IS NULL
  OR [PAX fatalities] IS NULL
  OR [Other fatalities] IS NULL
  OR [Total fatalities] IS NULL
  
  /*
   Also I noticed inssuficient value in 1 row. 
   This data contained YOM data from 1900. 
   I searched this crash on the internet and I found original values in this site.
   https://aviation-safety.net/database/record.php?id=20080901-1
   And YOM data that should be belong to 1990.
   I fixed this situation.
   */
UPDATE
  Plane
SET
  YOM = '1990'
WHERE
  YOM = '1900'

------------------------------------------------------------------------------ANALYSIS---------------------------------------------------------------------------------
-- For creating a true insight we need to get answer 8 questions. This questions really helpful for our analysis.

/*
 1. To find out in which years the accident occurred the most by dividing the dates into years.
 */
SELECT
  count(*),
  DATEPART(
    year
    FROM
      date
  )
FROM
  Plane
GROUP BY
  DATEPART(
    year
    FROM
      date
  )
ORDER BY
  count(*) DESC 
  -- According to the query, the year 1944 ranks first with 889 accidents.
  
SELECT
  datepart(
    YEAR
    FROM
      date
  ),
  [Flight type],
  count(*)
FROM
  Plane
WHERE
  datepart(
    YEAR
    FROM
      date
  ) = '1944'
GROUP BY
  datepart(
    YEAR
    FROM
      date
  ),
  [Flight type] 
  -- When we go a little deeper this year, most of the crashed planes are military and bombing planes.
  
  /*
   2. To determine which seasons are suitable for accidents by dividing the dates into seasons.
   */
  (
    SELECT
      Q1,
      Q2,
      Q3,
      Q4,
      count(*)
    FROM
(
        SELECT
          CASE
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 12 THEN 'Winter'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 1 THEN 'Winter'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 2 THEN 'Winter'
          END AS "Q1",
          CASE
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 3 THEN 'Spring'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 4 THEN 'Spring'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 5 THEN 'Spring'
          END AS "Q2",
          CASE
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 6 THEN 'Summer'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 7 THEN 'Summer'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 8 THEN 'Summer'
          END AS "Q3",
          CASE
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 9 THEN 'Autumn'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 10 THEN 'Autumn'
            WHEN DATEPART(
              MONTH
              FROM
                date
            ) = 11 THEN 'Autumn'
          END AS "Q4"
        FROM
          Plane
      ) months
    GROUP BY
      Q1,
      Q2,
      Q3,
      Q4
  )
  /*
   According to this query, almost all seasons are very close to each other in terms of the number of accidents. 
   However, as can be expected, the weather conditions in winter can be more favorable for an accident. 
   In the written query, we can see that there are more accidents in the winter season.
   */
   
  /*
   3. To find out which model year and which model aircraft are most susceptible to an accident.
   */
SELECT
  Aircraft,
  yom,
  count(*)
FROM
  Plane
GROUP BY
  Aircraft,
  yom
ORDER BY
  count(*) DESC 
  -- According to the query, the aircraft with the most crashes was the Douglas C-47 Skytrain (DC-3) and the model year was 1944. There were 948 accidents.
  
  /*
   4. To find out at what time the accidents took place.
   */
SELECT
  [Flight phase],
  count(*)
FROM
  Plane
GROUP BY
  [Flight phase]
  /*
   According to the query, the most common accident occurs during the flight. 
   The next happens during the landing. The least number of accidents happen during parking.
   */
   
  /*
   5. To learn the causes of accidents. (crash cause)
   */
SELECT
  [Crash cause],
  count(*)
FROM
  Plane
GROUP BY
  [Crash cause]
  /*
   While the majority of accidents are caused by unknown reasons, 
   this list is followed by human factor, technical malfunctions, 
   weather conditions, terrorism and other reasons.
   */
   
  /*
   6. To learn flight types.
   */
SELECT
  [Flight type],
  count(*)
FROM
  Plane
GROUP BY
  [Flight type]
ORDER BY
  count(*) DESC
  /*
   According to the query, accidents mostly happen on scheduled flights. This is followed by military and training flights.
   */
   
  /*
   7. To learn in which countries and on which continents the accidents took place.
   */
SELECT
  Country,
  count(*)
FROM
  Plane
GROUP BY
  Country
ORDER BY
  count(*) DESC
SELECT
  Region,
  count(*)
FROM
  Plane
GROUP BY
  Region
ORDER BY
  count(*) DESC
  /*
   According to the query, accidents mostly occur in the USA, followed by the UK and Russia. 
   In addition, North America is the region with the highest number of accidents, followed by Europe and Asia.
   */
   
  /*
   8. To be able to calculate the conditions of the crew and passengers on the plane at the time of the accident.
   */
  (
    SELECT
      sum([Total fatalities])
    FROM
      Plane
  )
  /*
   According to all records, a total of 158828 people lost their lives.
   */
   
  -- Let's dive in more deeper with our insights.
  
  ------------------------------------------------------------------------------INSIGHTS---------------------------------------------------------------------------------
  /*
   1. My first insight is make a more think about dates. 
   Because dates are the key point our analysis.
   */
SELECT
  DATEPART(
    year
    FROM
      date
  ),
  [Flight type],
  COUNT([Flight type])
FROM
  Plane
GROUP BY
  DATEPART(
    year
    FROM
      date
  ),
  [Flight type]
ORDER BY
  count([Flight type]) DESC
  /*
   It's more clear right now. We see 4 years top of our results.
   It's 1945, 1944, 1943 and 1942. 
   It was the time of World War II.
   In this years have 4 military flighting and 1 training values. 
   There are 1.131 different values for military flighting and 208 training values.
   */
   
  /*
   2. Let's talk about crash causes. If we understand crash cause problems, 
   we can answer why the crashes did happen? 
   Technical failure, weather, human factor or what. We need this answer.
   */
SELECT
  [Crash cause],
  count(*)
FROM
  Plane
GROUP BY
  [Crash cause]
ORDER BY
  count(*) DESC
  /*
   As you can see over here, there are 6 different problems meet us.
   Unknown, human factor, technical failure, weather, sabotage and other causes.
   As might be expected unknown causes are really much. They 9.732 rows.
   We can't talk about unknown problems, because we don't have too much information about they.
   Let's talk about human factors and technical failures.
   
   Human factors have 9.103 different rows.
   Technical failures have 5.814 different rows.
   
   Let's more dive in for technical failures.
   */
SELECT
  Aircraft,
  count(*)
FROM
  Plane
WHERE
  [Crash cause] = 'Technical failure'
GROUP BY
  Aircraft
ORDER BY
  count(*) DESC
  /*
   We searched which aircraft made a crash for technical failures.
   I share first 3 values right now. But I will share all of them in my visualization.
   First aircraft is Douglas C-47 Skytrain (DC-3) and it has 424 different crashes. This plane is type of military transport aircraft.
   Second aircraft is Curtiss C-46 Commando and it has 198 different crashes. Also this plane too military transport aircraft.
   Last plane is PZL-Mielec AN-2 and it has 180 different crashes. And this plane is type of agricultural plane.
   */
   
SELECT
  operator,
  count(*)
FROM
  Plane
WHERE
  Aircraft = 'Douglas C-47 Skytrain (DC-3)'
GROUP BY
  Operator
ORDER BY
  count(*) DESC
  /*
   I would like to investigate a little more about the Douglas C-47 Skytrain (DC-3) aircraft, which is at the top of our list. 
   Let's look at 3 operators that have this aircraft in their inventory.
   First is United States Army Air Forces - USAAF and they have 394 aircrafts of this model. This operator changed it's name to USAF in September 26, 1947.
   Second is United States Air Force - USAF and they have 220 aircrafts.
   Last one is Royal Air Force - RAF and they have 179 aircrafts.
   */
   
  /*
   3. By combining the model years of the crashed planes with technical reasons, 
   it can be measured how much accident the new or old generation planes cause. 
   Thus, including which airline companies the planes belong to,
   the insight may arise that these companies should replace their aircraft in the inventory with new generation aircraft.
   */
SELECT
  count(*)
FROM
  Plane
WHERE
  [Crash cause] = 'Technical failure'
  /*
   As you can see that there are 5.814 different crashes for technical failure reason.
   */
SELECT
  Operator,
  Gen,
  count(*) AS Amount
FROM
  (
    SELECT
      Operator,
      CASE
        WHEN YOM >= '1990' THEN 'New'
        ELSE 'Old'
      END AS Gen
    FROM
      Plane
    WHERE
      [Crash cause] = 'Technical failure'
      AND YOM != 'Unknown'
  ) Generations
GROUP BY
  Operator,
  Gen
ORDER BY
  count(*) DESC
  /*
   I did a research and came to the conclusion that the airplanes produced after 1990 are the new generation. 
   It would be correct to call the others the old generation.
   According to the query I made, there are accident data for 208 new generation and 4574 old generation aircraft.
   Looking at the top 3 data:
   United States Air Force - USAF Old 325
   Aeroflot - Russian International Airlines Old 249
   Royal Air Force - RAF Old 186
   */
   
  /*
   4. Another phase of our analysis is the question of when accidents occur according to flight types. 
   Thus, some uncertainties related to flight safety can be eliminated.
   */
SELECT
  top 5 [Flight type],
  count(*)
FROM
  Plane
GROUP BY
  [Flight type]
ORDER BY
  count(*) DESC
  /*
   When we look at the top 5 flight types,
   Scheduled Revenue Flight  -> 5.977
   Military  -> 4.477
   Training  -> 3.254
   Cargo  -> 2.785
   Private  -> 2.292
   total accident meets us.
   */
   
SELECT
  [Flight type],
  [Flight phase],
  count([Flight phase])
FROM
  Plane
WHERE
  [Flight type] = 'Scheduled Revenue Flight'
  OR [Flight type] = 'Military'
  OR [Flight type] = 'Training'
  OR [Flight type] = 'Cargo'
  OR [Flight type] = 'Private'
GROUP BY
  [Flight type],
  [Flight phase]
ORDER BY
  count([Flight phase]) DESC
  /*
   When we dig a little deeper into our analysis, the times in which the accidents result are as in the comments.
   Scheduled Revenue Flight -> Landing (descent or approach) -> 2.632 Crashes
   Military -> Flight -> 1.906 Crashes
   Training -> Flight -> 1.574 Crashes
   Cargo -> Landing (descent or approach) -> 1.260
   Private -> Flight -> 854
   */
   
SELECT
  [Flight type],
  [Crash site],
  COUNT(*)
FROM
  Plane
GROUP BY
  [Flight type],
  [Crash site]
ORDER BY
  count(*) DESC
  /*
   When we deeper our analysis, the region where the accident occurred in all of these flight types is the Airport (less than 10 km from airport).
   Scheduled Revenue Flight -> Airport (less than 10 km from airport) -> 3.156
   Military -> Airport (less than 10 km from airport) -> 2.046
   Training -> Airport (less than 10 km from airport) -> 1.788
   Cargo -> Airport (less than 10 km from airport) -> 1.695
   Private -> Airport (less than 10 km from airport) -> 1.128
   */
   
  --I finished insights. Let's visualize this insights and analysis.
