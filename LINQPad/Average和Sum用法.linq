<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = from p in Products
			group p by p.SupplierID into g
			select new {
				Sum = g.Sum(m=>m.UnitPrice),
				Quantity = g.Count(),
				Max = g.Average(m=>m.UnitPrice)
			};
query.Dump();

/*
SELECT SUM([t0].[UnitPrice]) AS [Sum], COUNT(*) AS [Quantity], AVG([t0].[UnitPrice]) AS [Max]
FROM [Products] AS [t0]
GROUP BY [t0].[SupplierID]
*/