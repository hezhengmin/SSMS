<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

Employees e =  Employees.Where(m=>m.Title.StartsWith("V")).First();

e.Dump();

/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = 'V%'
-- EndRegion
SELECT TOP (1) [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName], [t0].[Title], [t0].[TitleOfCourtesy], [t0].[BirthDate], [t0].[HireDate], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[HomePhone], [t0].[Extension], [t0].[Photo], [t0].[Notes], [t0].[ReportsTo], [t0].[PhotoPath]
FROM [Employees] AS [t0]
WHERE [t0].[Title] LIKE @p0

*/