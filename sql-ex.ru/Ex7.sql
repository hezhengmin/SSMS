-- Get the models and prices for all commercially available products (of any type) produced by maker B.

select T.model , T.price
from product pro
join (
select pc.price ,pc.model from pc
union 
select l.price ,l.model from laptop l
union
select pri.price ,pri.model from printer pri
) T on T.model = pro.model and pro.maker = 'B'