<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

Employees.Where (p => p.ReportsTo == null)
	.Dump ("ReportsTo with a null reportsTo, using a variable");
int? reportsTo = null;
/*
SELECT [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName], [t0].[Title], [t0].[TitleOfCourtesy], [t0].[BirthDate], [t0].[HireDate], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[HomePhone], [t0].[Extension], [t0].[Photo], [t0].[Notes], [t0].[ReportsTo], [t0].[PhotoPath]
FROM [Employees] AS [t0]
WHERE [t0].[ReportsTo] IS NULL
*/

Employees.Where (p => p.ReportsTo == reportsTo)
	.Dump ("ReportsTo with a null reportsTo, using a variable");
/*
DECLARE @p0 Int = null
-- EndRegion
SELECT [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName], [t0].[Title], [t0].[TitleOfCourtesy], [t0].[BirthDate], [t0].[HireDate], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[HomePhone], [t0].[Extension], [t0].[Photo], [t0].[Notes], [t0].[ReportsTo], [t0].[PhotoPath]
FROM [Employees] AS [t0]
WHERE [t0].[ReportsTo] = @p0
*/

Employees.Where (p => object.Equals (p.ReportsTo, reportsTo))
	.Dump ("Using the static object.Equals method, with a non-null variable");
/*
SELECT [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName], [t0].[Title], [t0].[TitleOfCourtesy], [t0].[BirthDate], [t0].[HireDate], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[HomePhone], [t0].[Extension], [t0].[Photo], [t0].[Notes], [t0].[ReportsTo], [t0].[PhotoPath]
FROM [Employees] AS [t0]
WHERE [t0].[ReportsTo] IS NULL
*/	

reportsTo = 5;			
Employees.Where (p => object.Equals (p.ReportsTo, reportsTo))
	.Dump ("Using the static object.Equals method, with a non-null variable");
/*
-- Region Parameters
DECLARE @p0 Int = 5
-- EndRegion
SELECT [t0].[EmployeeID], [t0].[LastName], [t0].[FirstName], [t0].[Title], [t0].[TitleOfCourtesy], [t0].[BirthDate], [t0].[HireDate], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[HomePhone], [t0].[Extension], [t0].[Photo], [t0].[Notes], [t0].[ReportsTo], [t0].[PhotoPath]
FROM [Employees] AS [t0]
WHERE ([t0].[ReportsTo] IS NOT NULL) AND ([t0].[ReportsTo] = @p0)
*/	