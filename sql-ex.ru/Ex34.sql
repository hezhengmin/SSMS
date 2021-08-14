-- In accordance with the Washington Naval Treaty concluded in the beginning of 1922, 
-- it was prohibited to build battle ships with a displacement of more than 35 thousand tons.
-- Get the ships violating this treaty (only consider ships for which the year of launch is known).
-- List the names of the ships.

select distinct s.name 
from ships s
join classes c on c.class = s.class
where c.displacement > 35000 and s.launched>=1922 and type = 'bb'