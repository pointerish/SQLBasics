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

--SELECT from Nobel

--1

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 --2

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--3

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

--4

SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject = 'Peace';

--5

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr >= 1980 AND yr <= 1989;

--6

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'Theodore Roosevelt'
OR winner = 'Woodrow Wilson'
OR winner = 'Jimmy Carter'
OR winner = 'Barack Obama';

--7

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

--8

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984);

--9

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry', 'Medicine');

--10

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr >= 2004);

--11

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

--12

SELECT yr, subject, winner
FROM nobel
WHERE winner = "EUGENE O'NEILL";

--13

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%';

--14

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY
 CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END,
  subject,winner;

-- SELECT within SELECT

--1

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2

SELECT name FROM world
  WHERE (gdp/population) >
     (SELECT (gdp/population) FROM world
      WHERE name='United Kingdom')
  AND continent = 'Europe';

--3

SELECT name, continent FROM world
  WHERE continent IN 
    (SELECT continent FROM world
       WHERE name IN ('Argentina', 'Australia'))
  ORDER BY name;

--4

SELECT name, population
FROM world
WHERE population >
  (SELECT population FROM world WHERE name = 'Canada')
AND population <
  (SELECT population FROM world WHERE name = 'Poland');

--5

SELECT name, CONCAT(ROUND(100* (population/(SELECT population
                           FROM world
                           WHERE name='Germany'))), '%')
FROM world
WHERE continent='Europe';

--6

SELECT name FROM world
WHERE gdp > ALL(SELECT gdp
                FROM world
                WHERE continent='Europe'
                AND gdp IS NOT NULL)
AND continent != 'Europe';

--7

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

--8

SELECT continent, name
  FROM world x
  WHERE name <= ALL
  (SELECT name FROM world y WHERE y.continent = x.continent)

--9

SELECT name, continent, population
  FROM world x
  WHERE 25000000  > ALL
  (SELECT population FROM world y WHERE x.continent = y.continent AND y.population > 0)

--10

SELECT name, continent
  FROM world x
  WHERE population > ALL
  (SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name <> x.name)

-- SUM and COUNT

--1

SELECT SUM(population)
FROM world

--2 

SELECT DISTINCT continent
FROM world;

--3

SELECT SUM(GDP)
FROM world
WHERE continent='Africa';

--4

SELECt COUNT(name)
FROM world
WHERE area>=1000000;

--5

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

--6

SELECT continent, COUNT(name)
FROM world
GROUP BY continent

--7

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

--8

SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000

--JOIN operation

--1

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

--2

SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012;

--3

SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid='GER';

--4

SELECT team1,team2,player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%';

--5

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id 
 WHERE gtime<=10

--6

SELECT mdate, teamname FROM game
  JOIN eteam ON (team1=eteam.id AND coach = 'Fernando Santos')

--7

SELECT player FROM goal JOIN game ON (matchid=id)
WHERE stadium='National Stadium, Warsaw';

--8

SELECT DISTINCT(player) FROM game
  JOIN goal ON (matchid=id)
WHERE ((team1='GER' OR team2='GER') AND teamid != 'GER')

--9

SELECT teamname, COUNT(player) FROM eteam
  JOIN goal ON (id=teamid)
GROUP BY teamname

--10

SELECT DISTINCT(stadium), COUNT(goal.player)
FROM game JOIN goal ON (matchid=id)
GROUP BY stadium;

--11

SELECT matchid, mdate, COUNT(player) FROM game
JOIN goal ON (matchid=id AND (team1 = 'POL' OR team2 = 'POL'))
GROUP BY matchid, mdate;

--12

SELECT id, mdate, COUNT(player) FROM game
  JOIN goal ON (id=matchid AND (team1 = 'GER' OR team2 = 'GER') AND teamid='GER')
GROUP BY id, mdate;

--13

SELECT mdate, team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id=matchid)
    GROUP BY mdate, team1, team2
    ORDER BY mdate, matchid, team1, team2

--MORE JOIN

--1

SELECT id, title
 FROM movie
 WHERE yr=1962

--2

SELECT yr FROM movie
WHERE title='Citizen Kane';

--3

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

--4

SELECT id
FROM actor
WHERE name='Glenn Close';

--5

SELECT id
FROM movie
WHERE title='Casablanca';

--6

SELECT name FROM actor, casting
WHERE id=actorid AND movieid=(SELECT id FROM movie WHERE title='Casablanca');

--7

SELECT name FROM actor, casting
WHERE id=actorid AND movieid=(SELECT id FROM movie WHERE title='Alien');

--8

SELECT title FROM movie
JOIN casting ON (id=movieid AND actorid=(SELECT id FROM actor WHERE name='Harrison Ford'));

--9

SELECT title FROM movie
JOIN casting ON (id=movieid AND actorid=(
  SELECT id FROM actor WHERE name='Harrison Ford' AND ord <> 1));

--10

SELECT title, name
FROM movie JOIN casting ON (id=movieid)
JOIN actor ON (actor.id=actorid)
WHERE ord=1 AND yr=1962;

--11

SELECT yr, COUNT(title) 
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2;

--12

SELECT title, name FROM movie
JOIN casting x ON movie.id=movieid
JOIN actor ON actor.id=actorid
WHERE ord=1 AND movieid IN
  (SELECT movieid FROM casting y
  JOIN actor ON actor.id=actorid
  WHERE name='Julie Andrews');

--13

SELECT name FROM actor
  JOIN casting ON (id=actorid AND (
    SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name;

--14

SELECT title, COUNT(actorid)
FROM movie JOIN casting on id=movieid
WHERE yr=1978
GROUP BY title
ORDER BY cast DESC;

--15

SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (
  SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) 
  AND name != 'Art Garfunkel'
GROUP BY name;