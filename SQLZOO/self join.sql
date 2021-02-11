--1.How many stops are in the database.
select count(*)
from stops

--2.Find the id value for the stop 'Craiglockhart'
select id
from stops
where name = 'Craiglockhart'

--3.Give the id and the name for the stops on the '4' 'LRT' service.
select id,name
from stops,route
where id = stop and num = '4' and company = 'LRT'

--4.The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
--Run the query and notice the two services that link these stops have a count of 2.
--Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2

--5.Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart,
--without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop = 149

--6.The query shown is similar to the previous one, however by joining two copies
--of the stops table we can refer to stops by name rather than by number.
--Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
--If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'


--7.Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
--solve1
select r1.company, r1.num
from route r1
join route r2 ON r1.num = r2.num
where r1.stop = 115 and r2.stop = 137
group by r1.company, r1.num
--solve2
select distinct r1.company, r1.num
from route r1
join route r2 ON r1.num = r2.num
where r1.stop = 115 and r2.stop = 137

--8.Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
select r1.company, r1.num
from route r1
join route r2 ON r1.num = r2.num
join stops s1 on r1.stop = s1.id
join stops s2 on r2.stop = s2.id
where s1.name = 'Craiglockhart' and s2.name = 'Tollcross'

--9.Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus,
--including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no.
--of the relevant services.
select distinct s2.name, r1.company, r1.num
from route r1
join route r2 ON r1.num = r2.num and r1.company = r2.company
join stops s1 on r1.stop = s1.id 
join stops s2 on r2.stop = s2.id 
where s1.name = 'Craiglockhart'

--10.Find the routes involving two buses that can go from Craiglockhart to Lochend.
--Show the bus no. and company for the first bus, the name of the stop for the transfer,
--and the bus no. and company for the second bus.
select D1.r1_num, D1.r1_company, D1.s2_name, D2.r4_num, D2.r4_company
from
(select 
r1.num as r1_num, r1.company as r1_company, s1.name as s1_name, s1.id as s1_id, 
r2.num as r2_num, r2.company as r2_company, s2.name as s2_name, s2.id as s2_id 
from route r1
join route r2 on r1.num = r2.num and r1.company = r2.company
join stops s1 on r1.stop = s1.id
join stops s2 on r2.stop = s2.id
where s1.name = 'Craiglockhart')  D1 
join
(select 
r3.num as r3_num, r3.company as r3_company, s3.name as s3_name, s3.id as s3_id, 
r4.num as r4_num, r4.company as r4_company, s4.name as s4_name, s4.id as s4_id
from route r3
join route r4 on r3.num = r4.num and r3.company = r4.company
join stops s3 on r3.stop = s3.id
join stops s4 on r4.stop = s4.id
where s4.name = 'Lochend') D2
on D1.s2_name = D2.s3_name 



