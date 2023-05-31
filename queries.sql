-- write your queries underneath each number:
 
-- 1. the total number of rows in the database
SELECT COUNT(*) FROM homicide_weapons;
-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT (state, handgun, rifle) FROM homicide_weapons LIMIT 15;
-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT (state, handgun, rifle) FROM homicide_weapons ORDER BY handgun desc LIMIT 15;
-- 4. add a new column without a default value
ALTER TABLE homicide_weapons ADD COLUMN non_firearm integer;
-- 5. set the value of that new column
UPDATE homicide_weapons SET non_firearm = sharp_object + blunt_object + body_part + fire + narcotics + asphyxiation + other + not_specified;
-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT ON (asphyxiation) asphyxiation FROM homicide_weapons;
-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT shotgun, AVG(rifle) FROM homicide_weapons GROUP BY shotgun;
-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 
SELECT shotgun, AVG(rifle) FROM homicide_weapons GROUP BY shotgun HAVING MAX(all_weapons) - MIN(all_weapons) > 200;
-- 9. add a new column, percent_firearm
ALTER TABLE homicide_weapons ADD COLUMN percent_firearm decimal;
-- 10. set the percent_firearm column to the sum of all firearm-related homicides divided by all homicides
UPDATE homicide_weapons SET percent_firearm = (firearm::decimal + handgun + rifle + shotgun) / all_weapons;
-- 11. sort the states by descending number of sharp_object homicides
SELECT (state, sharp_object) FROM homicide_weapons ORDER BY sharp_object desc LIMIT 15;
-- 12. sort the states by ratio of handgun to object-related homicides
SELECT state FROM homicide_weapons ORDER BY handgun::decimal / (sharp_object + blunt_object) LIMIT 15;