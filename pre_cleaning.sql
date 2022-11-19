/*
Some lines had special characters. 
Using the Notepad++ application, these special characters have been updated using the UTF-8-BOM writing style, thus introducing special characters.
Also, when I examined the data for discovery, I saw a value of 26% in some operator names. 
This value was in 435 different rows. Before integrating the data into Sql Server, I replaced these values with '&' using find and replace in Excel.
*/

-- This table has 24 columns and 28.536 rows.
select * from Plane

/*
[Flight no#]
This column have 1 distinct value. It's 'NA'.
We don't need this column.
*/
select distinct [Flight no#] from Plane

/*
Time
This column has a lot of null values. Also we don't need time values of this crashes for our analysis.
*/
select Time from Plane
-- [Flight no#] and Time columns need to be deleted.

-- Also we don't want to null values. If rows are really critic for our analysis, we don't delete this rows. Just change with 'Unknown' text.
select * from Plane
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
select * from Plane
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
select * from Plane
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
When I uploaded the data to Tableau to verify, 
I saw that some countries were qualified as 'unknown'.
This values are: Ascension Island, Chagos Archipelago, Comoros Islands, 
Dutch Antilles, Fiji Islands, French Guyana, Maldivian Islands, Guam Island, Samoa Islands, Unknown and World.
We need to fix this problem. Because Tableau doesn't agree this values.
*/
select * from Plane
where Country like '%Ascension Island%'
or Country like '%Chagos Archipelago%'
or Country like '%Comoros Islands%'
or Country like '%Dutch Antilles%'
or Country like '%Fiji Islands%'
or Country like '%French Guyana%'
or Country like '%Guam Island%'
or Country like '%Maldivian Islands%'
or Country like '%Samoa Islands%'
or Country like '%Unknown%'
or Country like '%World%'

/*
Final way of my pre cleaning step, ı searched null values in the type of float columns. 
There are 66 rows and ı don't have true values for this rows.
For this reason ı need to delete this rows.
*/
select * from Plane
where [Crew on board] is null
or [Crew fatalities] is null
or [Pax on board] is null
or [PAX fatalities] is null
or [Other fatalities] is null
or [Total fatalities] is null

-- I finished pre cleaning phase.
