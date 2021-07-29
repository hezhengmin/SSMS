-- List all printer makers. Result set: maker.

select distinct pro.maker 
from product pro
left join printer pri on pri.model = pro.model
where pro.type='Printer'


select distinct maker 
from product
where type='Printer'



