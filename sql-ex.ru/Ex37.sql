-- Find classes for which only one ship exists in the database (including the Outcomes table).

--solve1
with cte 
as (
select class from ships
union all
select distinct c.class from outcomes o
join classes c on c.class = o.ship
where o.ship not in (select name from ships)
)

select * 
from cte
group by class
having count(class) = 1

--solve2
with cte 
as (
select name, class from ships
union 
select o.ship 'name',c.class from outcomes o
join classes c on c.class = o.ship --left join
)

select class 
from cte
group by class
having count(class) = 1
