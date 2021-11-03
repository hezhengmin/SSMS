<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = from o in Orders
			join s in Shippers
			on o.ShipVia equals s.ShipperID 
			select new {o,s};
			query.Dump();
/*
SELECT [t0].[OrderID], [t0].[CustomerID], [t0].[EmployeeID], [t0].[OrderDate], [t0].[RequiredDate], [t0].[ShippedDate], [t0].[ShipVia], [t0].[Freight], [t0].[ShipName], [t0].[ShipAddress], [t0].[ShipCity], [t0].[ShipRegion], [t0].[ShipPostalCode], [t0].[ShipCountry], [t1].[ShipperID], [t1].[CompanyName], [t1].[Phone]
FROM [Orders] AS [t0]
INNER JOIN [Shippers] AS [t1] ON [t0].[ShipVia] = ([t1].[ShipperID])
*/

