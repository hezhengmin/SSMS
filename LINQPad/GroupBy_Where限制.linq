<Query Kind="Expression">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

from c in Customers
group c by c.City into g
where g.Count()>3
select new 
{
	City = g.Key,
	Count = g.Count()
}
/*
-- Region Parameters
DECLARE @p0 Int = 3
-- EndRegion
SELECT [t1].[City], [t1].[value2] AS [Count]
FROM (
    SELECT COUNT(*) AS [value], COUNT(*) AS [value2], [t0].[City]
    FROM [Customers] AS [t0]
    GROUP BY [t0].[City]
    ) AS [t1]
WHERE [t1].[value] > @p0
*/