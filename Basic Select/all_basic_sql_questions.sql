/* Q1-REVISING THE SELECT QURERY I- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

/*Q2-REVISING THE SELECT QURERY II- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

/*Q3-SELECT ALL- Query all columns (attributes) for every row in the CITY table.*/
SELECT *
FROM CITY;

/*Q4-SELECT BY ID- Query all columns for a city in CITY with the ID 1661*/
SELECT *
FROM CITY
WHERE ID = 1661;

/*Q5-JAPANESE CITIES' ATTRIBUTES- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*Q6-JAPANESE CITIES'NAMES- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*Q7-WEATHER OBSERVATION STATION 1- Query a list of CITY and STATE from the STATION table*/
SELECT CITY, STATE
FROM STATION;

/*Q8-WEATHER OBSERVATION STATION 3- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.*/
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2) = 0;

/*Q9-WEATHER OBSERVATION STATION 4- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;


/*Q10-WEATHER OBSERVATION STATION 5- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/

--Using 2 separate queries
SELECT CITY,LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

SELECT CITY,LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;

--OR using one query--
SELECT CITY,LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) IN
                    (SELECT MAX(CHAR_LENGTH(CITY))
                    FROM STATION
                    UNION
                    SELECT MIN(CHAR_LENGTH(CITY))
                    FROM STATION)
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 2;

/*Q11-WEATHER OBSERVATION STATION 6- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) IN ('A','E','I','O','U');

/*Q12-WEATHER OBSERVATION STATION 7- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY,1) IN ('A','E','I','O','U');

/*Q13-WEATHER OBSERVATION STATION 8- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) IN ('A','E','I','O','U') 
		AND RIGHT(CITY,1) IN ('A','E','I','O','U');

/*Q14-WEATHER OBSERVATION STATION 9- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U'); 

/*Q15-WEATHER OBSERVATION STATION 10- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT (CITY,1) NOT IN ('A','E','I','O','U'); 

/*Q16-WEATHER OBSERVATION STATION 11-Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') 
                    OR RIGHT (CITY,1) NOT IN ('A','E','I','O','U');

/*Q17-WEATHER OBSERVATION STATION 12- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') 
                    AND RIGHT (CITY,1) NOT IN ('A','E','I','O','U');

/*Q18-HIGHER THAN 75 MARKS- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name.If two or more 
students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3) ASC, ID ASC;

/*Q19-EMPLOYEE NAMES- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.*/
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

/*Q20-EMPLOYEE SALARIES- Write a query that prints a list of employee names (i.e.: the name attribute) for employees
in Employee having a salary greater than  per month who have been employees for less than  months.
Sort your result by ascending employee_id.*/
SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;


