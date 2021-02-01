--1.List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

--2.Give year of 'Citizen Kane'.
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

--3.List all of the Star Trek movies, include the id, title and yr 
--(all of these movies include the words Star Trek in the title). 
--Order results by year.
select id ,title , yr
from movie
where title like '%Star%Trek%'
order by yr

--4.What id number does the actor 'Glenn Close' have?
select id
from actor 
where name = 'Glenn Close'

--5.What is the id of the film 'Casablanca'
select id
from movie 
where title = 'Casablanca'

--6.Obtain the cast list for 'Casablanca'.
--what is a cast list?
--Use movieid=11768, (or whatever value you got from the previous question)
select name
from movie 
join casting on movieid = id
join actor on actor.id = casting.actorid
where title = 'Casablanca'

--7.Obtain the cast list for the film 'Alien'
select name
from movie 
join casting on movieid = id
join actor on actor.id = casting.actorid
where title = 'Alien'

--8.List the films in which 'Harrison Ford' has appeared
select title
from movie 
join casting on movieid = id
join actor on actor.id = casting.actorid
where actor.name = 'Harrison Ford'

--9.List the films where 'Harrison Ford' has appeared - but not in the starring role. 
--[Note: the ord field of casting gives the position of the actor. 
--If ord=1 then this actor is in the starring role]
select title
from movie 
join casting on movieid = id
join actor on actor.id = casting.actorid
where actor.name = 'Harrison Ford' and casting.ord != 1

--10.List the films together with the leading star for all 1962 films.
select title, name
from movie 
join casting on movieid = id
join actor on actor.id = casting.actorid
where yr=1962 and casting.ord = 1

--11.Which were the busiest years for 'Rock Hudson', 
--show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--12.List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--解法1
select m.title, a2.name
from casting c1
join actor a1 on c1.actorid = a1.id and a1.name = 'Julie Andrews' 
join casting c2 on c1.movieid = c2.movieid and c2.ord = 1
join actor a2 on c2.actorid = a2.id
join movie m on c2.movieid = m.id
group by m.title , a2.name
--解法2
select distinct m.title, a2.name
from casting c1
join actor a1 on c1.actorid = a1.id and a1.name = 'Julie Andrews' 
join casting c2 on c1.movieid = c2.movieid and c2.ord = 1
join actor a2 on c2.actorid = a2.id
join movie m on c2.movieid = m.id


--13.Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
select name
from casting 
join actor on id = actorid
where ord = 1 
group by name 
having count(movieid)>=15
order by name

--14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
--解法1
select title ,count(movieid)  
from movie 
join casting on id = movieid and yr = 1978
group by movieid, title  
order by count(movieid) desc, title
--解法2
select title ,count(movieid)  
from movie 
join casting on id = movieid
group by movieid, title ,yr 
having yr = 1978 
order by count(movieid) desc, title
--解法3 Natural Join
select title ,count(movieid)  
from movie ,casting
where yr = 1978 and movie.id = casting.movieid
group by movieid, title ,yr 
order by count(movieid) desc, title

--15.List all the people who have worked with 'Art Garfunkel'.

--解法1.子查詢
select name
from casting
join actor on id = actorid
where movieid in ( 
select movieid 
from casting
join actor on id = actorid
where name = 'Art Garfunkel')
and name != 'Art Garfunkel'

--解法2.Join自己
select a2.name
from casting c
join actor a on a.id = c.actorid
join casting c2 on c.movieid = c2.movieid
join actor a2 on a2.id = c2.actorid
where a.name = 'Art Garfunkel' and a2.name != 'Art Garfunkel'
--解法3
select a2.name
from casting c
join actor a on a.id = c.actorid and a.name = 'Art Garfunkel'
join casting c2 on c.movieid = c2.movieid
join actor a2 on a2.id = c2.actorid and a2.name != 'Art Garfunkel'