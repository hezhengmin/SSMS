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
select new { c.CustomerID, c.Orders }
/*
SELECT [t0].[CustomerID], [t1].[OrderID], [t1].[CustomerID] AS [CustomerID2], [t1].[EmployeeID], [t1].[OrderDate], [t1].[RequiredDate], [t1].[ShippedDate], [t1].[ShipVia], [t1].[Freight], [t1].[ShipName], [t1].[ShipAddress], [t1].[ShipCity], [t1].[ShipRegion], [t1].[ShipPostalCode], [t1].[ShipCountry], (
    SELECT COUNT(*)
    FROM [Orders] AS [t2]
    WHERE [t2].[CustomerID] = [t0].[CustomerID]
    ) AS [value]
FROM [Customers] AS [t0]
LEFT OUTER JOIN [Orders] AS [t1] ON [t1].[CustomerID] = [t0].[CustomerID]
ORDER BY [t0].[CustomerID], [t1].[OrderID]

*/