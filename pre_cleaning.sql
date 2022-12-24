/*
 Some lines had special characters. 
 Using the Notepad++ application, these special characters have been updated using the UTF-8-BOM writing style, thus introducing special characters.
 Also, when I examined the data for discovery, I saw a value of 26% in some operator names. 
 This value was in 435 different rows. Before integrating the data into Sql Server, I replaced these values with '&' using find and replace in Excel.
 */
 
-- This table has 24 columns and 28.536 rows.
SELECT
  *
FROM
  Plane
  
  /*
   [Flight no#]
   This column have 1 distinct value. It's 'NA'.
   We don't need this column.
   */
SELECT
  DISTINCT [Flight no#]
FROM
  Plane
  
  /*
   Time
   This column has a lot of null values. Also we don't need time values of this crashes for our analysis.
   */
SELECT
  Time
FROM
  Plane 
  -- [Flight no#] and Time columns need to be deleted.
  
  -- Also we don't want to null values. If rows are really critic for our analysis, we don't delete this rows. Just change with 'Unknown' text.
SELECT
  *
FROM
  Plane
WHERE
  Aircraft IS NULL
  OR Operator IS NULL
  OR Registration IS NULL
  OR [Flight phase] IS NULL
  OR [Flight type] IS NULL
  OR Survivors IS NULL
  OR [Crash site] IS NULL
  OR Schedule IS NULL
  OR MSN IS NULL
  OR YOM IS NULL
  OR [Crash location] IS NULL
  OR Country IS NULL
  OR Region IS NULL
  OR [Crew on board] IS NULL
  OR [Crew fatalities] IS NULL
  OR [Pax on board] IS NULL
  OR [PAX fatalities] IS NULL
  OR [Other fatalities] IS NULL
  OR [Total fatalities] IS NULL
  OR Circumstances IS NULL
  OR [Crash cause] IS NULL 
  
  -- Also there are 12.189 rows have 'NA' values. It don't need to be change but, ı think 'Unknown' is more clear than 'NA'. So ı will change.
SELECT
  *
FROM
  Plane
WHERE
  Aircraft = 'NA'
  OR Operator = 'NA'
  OR Registration = 'NA'
  OR [Flight phase] = 'NA'
  OR [Flight type] = 'NA'
  OR Survivors = 'NA'
  OR [Crash site] = 'NA'
  OR Schedule = 'NA'
  OR MSN = 'NA'
  OR YOM = 'NA'
  OR [Crash location] = 'NA'
  OR Country = 'NA'
  OR Region = 'NA'
  OR Circumstances = 'NA'
  OR [Crash cause] = 'NA'
  
  /*
   Some YOM rows have insufficient data. 
   This YOM column has year of model of these planes. 
   For this reason this planes model years wouldn't be ('21','31','943' .etc) 
   */
SELECT
  *
FROM
  Plane
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
   When I uploaded the data to Tableau to verify, 
   I saw that some countries were qualified as 'unknown'.
   This values are: Ascension Island, Chagos Archipelago, Comoros Islands, 
   Dutch Antilles, Fiji Islands, French Guyana, Maldivian Islands, Guam Island, Samoa Islands, Unknown and World.
   We need to fix this problem. Because Tableau doesn't agree this values.
   */
SELECT
  *
FROM
  Plane
WHERE
  Country LIKE '%Ascension Island%'
  OR Country LIKE '%Chagos Archipelago%'
  OR Country LIKE '%Comoros Islands%'
  OR Country LIKE '%Dutch Antilles%'
  OR Country LIKE '%Fiji Islands%'
  OR Country LIKE '%French Guyana%'
  OR Country LIKE '%Guam Island%'
  OR Country LIKE '%Maldivian Islands%'
  OR Country LIKE '%Samoa Islands%'
  OR Country LIKE '%Unknown%'
  OR Country LIKE '%World%'
  
  /*
   Final way of my pre cleaning step, ı searched null values in the type of float columns. 
   There are 66 rows and ı don't have true values for this rows.
   For this reason ı need to delete this rows.
   */
SELECT
  *
FROM
  Plane
WHERE
  [Crew on board] IS NULL
  OR [Crew fatalities] IS NULL
  OR [Pax on board] IS NULL
  OR [PAX fatalities] IS NULL
  OR [Other fatalities] IS NULL
  OR [Total fatalities] IS NULL 
  
  -- I finished pre cleaning phase.
