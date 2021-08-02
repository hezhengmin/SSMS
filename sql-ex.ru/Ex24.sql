-- List the models of any type having the highest price of all products present in the database.
with cte
as
(
select pc.model,pc.price 
from pc
union
select printer.model, printer.price 
from printer
union
select laptop.model, laptop.price 
from laptop
),
B as
(
select model,max(price) as highest from cte
group by model
)

select model from B
where highest = (select max(highest) from B)
