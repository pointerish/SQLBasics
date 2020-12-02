--SELECT BASICS
--1

SELECT population FROM world
  WHERE name = 'Germany'

--2

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

--3

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--4

--SELECT names

--1

SELECT name FROM world
  WHERE name LIKE 'Y%'

--2

SELECT name FROM world
  WHERE name LIKE '%y'

--3

SELECT name FROM world
  WHERE name LIKE '%x%'

--4

SELECT name FROM world
  WHERE name LIKE '%land'

--5

SELECT name FROM world
  WHERE name LIKE 'C%ia'

--6

SELECT name FROM world
  WHERE name LIKE '%oo%'

--7

SELECT name FROM world
  WHERE LENGTH(name) - LENGTH(REPLACE(UPPER(name),'A','')) >= 3;

--8

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

--9

SELECT name FROM world
 WHERE name LIKE '%o__o%'

--10

SELECT name FROM world
 WHERE LENGTH(name) = 4;

--11

SELECT name
  FROM world
 WHERE name LIKE capital;

--12

SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City');

