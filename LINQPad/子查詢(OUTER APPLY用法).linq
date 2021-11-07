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
select 
	from o in c.Orders
	select new { c.CustomerID, o.OrderID }
/*
SELECT [t0].[CustomerID], [t2].[OrderID], (
    SELECT COUNT(*)
    FROM [Orders] AS [t3]
    WHERE [t3].[CustomerID] = [t0].[CustomerID]
    ) AS [value]
FROM [Customers] AS [t0]
OUTER APPLY (
    SELECT [t1].[OrderID]
    FROM [Orders] AS [t1]
    WHERE [t1].[CustomerID] = [t0].[CustomerID]
    ) AS [t2]
ORDER BY [t0].[CustomerID], [t2].[OrderID]
*/