<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = from e in Employees
			let FullName =e.LastName + " " + e.FirstName
			where e.Region == "WA"
			select new{ID = e.EmployeeID, Region = e.Region,FullName};

query.Dump();
/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = ' '
DECLARE @p1 NVarChar(1000) = 'WA'
-- EndRegion
SELECT [t1].[EmployeeID] AS [ID], [t1].[Region], [t1].[value] AS [FullName]
FROM (
    SELECT [t0].[EmployeeID], [t0].[Region], ([t0].[LastName] + @p0) + [t0].[FirstName] AS [value]
    FROM [Employees] AS [t0]
    ) AS [t1]
WHERE [t1].[Region] = @p1
*/
