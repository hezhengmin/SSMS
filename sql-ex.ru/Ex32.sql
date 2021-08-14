-- One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw).
-- Determine the average ship mw with an accuracy of two decimal places for each country 
-- having ships in the database.

select country,cast(avg(power(bore,3)/2) as decimal(10,2)) as weight
from (
select c.country,c.bore,s.name from classes c
join ships s on s.class = c.class
union 
select c.country, c.bore, o.ship 'name' 
from outcomes o
join classes c on c.class = o.ship
) c
group by country
