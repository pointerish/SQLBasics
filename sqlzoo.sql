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

 --13

 SELECT capital, name
  FROM world
  WHERE INSTR(capital, name) > 0;

--14

SELECT capital, name
  FROM world
  WHERE INSTR(capital, name) > 0
  AND LENGTH(capital) != LENGTH(name);

--15

SELECT name, REPLACE(capital, name, '') as 'ext'
  FROM world
  WHERE LENGTH(capital) - LENGTH(name) > 0
  AND INSTR(capital, name) > 0;

--SELECT FROM world

--1

SELECT name, continent, population FROM world;

--2

SELECT name FROM world WHERE population >= 200000000;

--3

SELECT name, (gdp / population) AS 'per capita GDP'
FROM world WHERE population >= 200000000;
