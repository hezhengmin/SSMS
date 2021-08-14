-- List the names of lead ships in the database (including the Outcomes table).

select name from ships
where name = class
union 
select ship from outcomes o
join classes c on c.class = o.ship
