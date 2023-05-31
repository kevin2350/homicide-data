# Overview
- Dataset is from Sage Data (dataplanet.sagepub.com)
- Dataset is titled "Weapon Used from the Supplementary Homicide Report Database"
- Data contains the types of weapons used to commit homicides in each state, along with the number of homicides performed with each weapon
- First column is the state, and the following columns are the type of weapon used in that state
- The state column is a string, all other columns and numeric
- Cleaned dataset is titled "homicide_weapons_2021.csv". Original csv from Sage Data is titled "original_data.csv".

# Table Design
- For the primary key, I choose to use a serial type since my data doesn't have any fields that would be good as a key
- Only the state field is a string type
- All other fields are integer types

# Import
- Import succeeded without error

# Database Information
```
1.
                                                                 List of databases
    Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Access privileges
------------+----------+----------+----------------------------+----------------------------+------------+-----------------+-----------------------
 homework06 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 postgres   | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
            |          |          |                            |                            |            |                 | postgres=CTc/postgres
 template1  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
            |          |          |                            |                            |            |                 | postgres=CTc/postgres
(4 rows)

2.
              List of relations
 Schema |       Name       | Type  |  Owner
--------+------------------+-------+----------
 public | homicide_weapons | table | postgres
(1 row)

3.
                                                                  Table "public.homicide_weapons"
    Column     |         Type          | Collation | Nullable |                   Default                    | Storage  | Compression | Stats target | Description
---------------+-----------------------+-----------+----------+----------------------------------------------+----------+-------------+--------------+-------------
 id            | integer               |           | not null | nextval('homicide_weapons_id_seq'::regclass) | plain    |             |              |
 state         | character varying(14) |           |          |                                              | extended |             |              |
 all_weapons   | integer               |           |          | 0                                            | plain    |             |              |
 firearm       | integer               |           |          | 0                                            | plain    |             |              |
 handgun       | integer               |           |          | 0                                            | plain    |             |              |
 rifle         | integer               |           |          | 0                                            | plain    |             |              |
 shotgun       | integer               |           |          | 0                                            | plain    |             |              |
 sharp_object  | integer               |           |          | 0                                            | plain    |             |              |
 blunt_object  | integer               |           |          | 0                                            | plain    |             |              |
 body_part     | integer               |           |          | 0                                            | plain    |             |              |
 fire          | integer               |           |          | 0                                            | plain    |             |              |
 narcotics     | integer               |           |          | 0                                            | plain    |             |              |
 asphyxiation  | integer               |           |          | 0                                            | plain    |             |              |
 other         | integer               |           |          | 0                                            | plain    |             |              |
 not_specified | integer               |           |          | 0                                            | plain    |             |              |
Indexes:
    "homicide_weapons_pkey" PRIMARY KEY, btree (id)
Access method: heap
```

# Query Results
```
### 1. total number of rows in database
 count
-------
    50
(1 row)

### 2. first 15 rows of database, with 3 columns state, handgun, and rifle
            row
---------------------------
 (Texas,1178,106)
 ("North Carolina",501,49)
 (Michigan,337,41)
 (Ohio,343,15)
 (Tennessee,304,27)
 (Georgia,449,38)
 (Alabama,334,38)
 ("South Carolina",377,21)
 (Indiana,405,20)
 (Virginia,305,20)
 (Missouri,304,21)
 (Illinois,338,10)
 (Pennsylvania,355,3)
 (Louisiana,179,30)
 (Colorado,265,8)
(15 rows)

### 3. first 15 rows, with 3 columns state, handgun, and rifle. results are sorted by the handgun column in descending order
            row
---------------------------
 (Texas,1178,106)
 ("North Carolina",501,49)
 (Georgia,449,38)
 (Indiana,405,20)
 ("South Carolina",377,21)
 (Pennsylvania,355,3)
 (Ohio,343,15)
 (Illinois,338,10)
 (Michigan,337,41)
 (Alabama,334,38)
 (Virginia,305,20)
 (Tennessee,304,27)
 (Missouri,304,21)
 (Colorado,265,8)
 (Kentucky,218,13)
(15 rows)

### 4. add a new column, non_firearm, that describes number of homicides committed without firearms
ALTER TABLE

(new table column list below)
                                                                  Table "public.homicide_weapons"
    Column     |         Type          | Collation | Nullable |                   Default                    | Storage  | Compression | Stats target | Description
---------------+-----------------------+-----------+----------+----------------------------------------------+----------+-------------+--------------+-------------
 id            | integer               |           | not null | nextval('homicide_weapons_id_seq'::regclass) | plain    |             |              |
 state         | character varying(14) |           |          |                                              | extended |             |              |
 all_weapons   | integer               |           |          | 0                                            | plain    |             |              |
 firearm       | integer               |           |          | 0                                            | plain    |             |              |
 handgun       | integer               |           |          | 0                                            | plain    |             |              |
 rifle         | integer               |           |          | 0                                            | plain    |             |              |
 shotgun       | integer               |           |          | 0                                            | plain    |             |              |
 sharp_object  | integer               |           |          | 0                                            | plain    |             |              |
 blunt_object  | integer               |           |          | 0                                            | plain    |             |              |
 body_part     | integer               |           |          | 0                                            | plain    |             |              |
 fire          | integer               |           |          | 0                                            | plain    |             |              |
 narcotics     | integer               |           |          | 0                                            | plain    |             |              |
 asphyxiation  | integer               |           |          | 0                                            | plain    |             |              |
 other         | integer               |           |          | 0                                            | plain    |             |              |
 not_specified | integer               |           |          | 0                                            | plain    |             |              |
 non_firearm   | integer               |           |          |                                              | plain    |             |              |
Indexes:
    "homicide_weapons_pkey" PRIMARY KEY, btree (id)
Access method: heap

### 5. set new non_firearm column to be sum of all non-firearm related homicide columns
UPDATE 50

(state and non_firearm column below, only first 15 rows)
          row
------------------------
 (Texas,663)
 ("North Carolina",272)
 (Michigan,256)
 (Ohio,203)
 (Tennessee,136)
 (Georgia,166)
 (Alabama,166)
 ("South Carolina",131)
 (Indiana,160)
 (Virginia,207)
 (Missouri,137)
 (Illinois,88)
 (Pennsylvania,115)
 (Louisiana,161)
 (Colorado,164)
(15 rows)

### 6. get unique number of deaths by asphyxiation across all states
 asphyxiation
--------------
            0
            1
            2
            3
            4
            5
            6
(7 rows)

### 7. group rows together by num. of shotgun homicides, and find the avg number of rifle homicides in each group.
(I assumed a negative correlation between the two since if more shotguns are being used, less rifles would be used.
The correlation is positive though since the states with more shotgun homicides just tend to have more homicides in general, so more rifle homicides as well.)

 shotgun |         avg
---------+----------------------
      20 |  49.0000000000000000
       8 |  39.5000000000000000
       9 |  17.3333333333333333
       7 |  23.0000000000000000
       1 |   3.2500000000000000
       4 |   7.0000000000000000
       2 |  10.0000000000000000
       0 |   1.2142857142857143
       6 |  15.0000000000000000
      21 | 106.0000000000000000
      12 |  27.0000000000000000
       3 |   4.3333333333333333
(12 rows)

### 8. select the groups where the difference between the num. of homicides in the state with the most & the state with the least is less than 200
 shotgun |         avg
---------+---------------------
       8 | 39.5000000000000000
       9 | 17.3333333333333333
       7 | 23.0000000000000000
       1 |  3.2500000000000000
       2 | 10.0000000000000000
       6 | 15.0000000000000000
       3 |  4.3333333333333333
(7 rows)

### 9. add a new column, percent_firearm, that shows the percentage of homicides by a firearm
ALTER TABLE

(new list of columns shown below)
                                                                   Table "public.homicide_weapons"
     Column      |         Type          | Collation | Nullable |                   Default                    | Storage  | Compression | Stats target | Description
-----------------+-----------------------+-----------+----------+----------------------------------------------+----------+-------------+--------------+-------------
 id              | integer               |           | not null | nextval('homicide_weapons_id_seq'::regclass) | plain    |             |              |
 state           | character varying(14) |           |          |                                              | extended |             |              |
 all_weapons     | integer               |           |          | 0                                            | plain    |             |              |
 firearm         | integer               |           |          | 0                                            | plain    |             |              |
 handgun         | integer               |           |          | 0                                            | plain    |             |              |
 rifle           | integer               |           |          | 0                                            | plain    |             |              |
 shotgun         | integer               |           |          | 0                                            | plain    |             |              |
 sharp_object    | integer               |           |          | 0                                            | plain    |             |              |
 blunt_object    | integer               |           |          | 0                                            | plain    |             |              |
 body_part       | integer               |           |          | 0                                            | plain    |             |              |
 fire            | integer               |           |          | 0                                            | plain    |             |              |
 narcotics       | integer               |           |          | 0                                            | plain    |             |              |
 asphyxiation    | integer               |           |          | 0                                            | plain    |             |              |
 other           | integer               |           |          | 0                                            | plain    |             |              |
 not_specified   | integer               |           |          | 0                                            | plain    |             |              |
 non_firearm     | integer               |           |          |                                              | plain    |             |              |
 percent_firearm | numeric               |           |          |                                              | main     |             |              |
Indexes:
    "homicide_weapons_pkey" PRIMARY KEY, btree (id)
Access method: heap

### 10. set new column to percent of homicides caused by a firearm in each state, in decimal form
UPDATE 50

(first 15 rows of state and new percent_firearm column shown below)
     state      |    percent_firearm
----------------+------------------------
 Texas          | 0.77087442472057856673
 North Carolina | 0.76023391812865497076
 Michigan       | 0.75210477081384471469
 Ohio           | 0.76307363927427961580
 Tennessee      | 0.82134831460674157303
 Georgia        | 0.81200453001132502831
 Alabama        | 0.79907621247113163972
 South Carolina | 0.83638583638583638584
 Indiana        | 0.79849812265331664581
 Virginia       | 0.72351421188630490956
 Missouri       | 0.80952380952380952381
 South Dakota   | 0.36170212765957446809
 Montana        | 0.47619047619047619048
 Illinois       | 0.66715542521994134897
 Pennsylvania   | 0.81045751633986928105
(15 rows)

#### 11. sort states by num. of homicides via sharp object (knife, etc..), in descending order. only get first 15 results
          row
-----------------------
 (Texas,187)
 (Michigan,58)
 ("North Carolina",49)
 (Colorado,47)
 (Indiana,47)
 (Arizona,47)
 (Washington,40)
 (Georgia,38)
 (Tennessee,38)
 (Louisiana,36)
 (Virginia,35)
 (Massachusetts,33)
 (Missouri,32)
 (Oklahoma,31)
 (Pennsylvania,29)
(15 rows)

### 12. sort states by their ratio of handgun homicides to object-related homicides (knives, bats, etc..)
     state
---------------
 New York
 Hawaii
 Alaska
 Rhode Island
 Massachusetts
 New Hampshire
 California
 New Mexico
 Iowa
 Nebraska
 South Dakota
 Wyoming
 Nevada
 Arizona
 Montana
(15 rows)

```