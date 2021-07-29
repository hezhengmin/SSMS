-- Find all records from the Printer table containing data about color printers.

select *
from printer
where color = 'y'

select *
from printer
where color not in ('n')

