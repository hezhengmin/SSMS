-- For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
-- Result set: maker, average screen size.

select pro.maker,avg(l.screen)
from laptop l
join product pro on pro.model = l.model
group by pro.maker