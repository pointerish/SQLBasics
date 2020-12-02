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

--4

SELECT name, (population / 1000000) as 'population'
FROM world
WHERE continent = 'South America';

--5

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

--6

SELECT name
FROM world
WHERE INSTR(name, 'United');

--7

SELECT name, population, area
FROM world
WHERE area >= 3000000
OR population >= 250000000;

--8

SELECT name, population, area
FROM world
WHERE area >= 3000000
XOR population >= 250000000;

--9

SELECT name, ROUND((population / 1000000), 2) AS 'population', ROUND((gdp / 1000000000), 2) AS 'gdp'
FROM world
WHERE continent = 'South America';

--10

SELECT name, ROUND((gdp/population), -3) AS 'per-capita GDP'
FROM world
WHERE gdp >= 1000000000000;

--11

SELECT name, capital
FROM world
WHERE LENGTH(capital) = LENGTH(name);

--12

SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital;

--13

SELECT name
FROM world
WHERE INSTR(name, 'a') > 0
AND INSTR(name, 'e') > 0
AND INSTR(name, 'i') > 0
AND INSTR(name, 'o') > 0
AND INSTR(name, 'u') > 0
AND name NOT LIKE '% %';
