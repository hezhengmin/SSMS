-- For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

select c.class, s.name, c.country 
from classes c
join ships s on s.class = c.class
where c.numGuns >=10