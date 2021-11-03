<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

DateTime date1 = new DateTime(1996, 1, 1);

var query = (from c in Employees
			where c.Orders.Any(m => m.OrderDate >= date1)
			select new { c.EmployeeID, c.LastName, c.FirstName });
query.Dump();

/*
-- Region Parameters
DECLARE @p0 DateTime = '1996-01-01 00:00:00.000'
-- EndRegion
SELECT [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName]
FROM [Employees] AS [t0]
WHERE EXISTS(
    SELECT NULL AS [EMPTY]
    FROM [Orders] AS [t1]
    WHERE ([t1].[OrderDate] >= @p0) AND ([t1].[EmployeeID] = [t0].[EmployeeID])
    )
*/