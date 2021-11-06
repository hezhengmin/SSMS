<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var pageSize = 10;
var pageIndex = 3;
var query = (from e in Customers
			select e).Skip((pageIndex-1)*pageSize).Take(pageSize);
query.Dump();	

/*
-- Region Parameters
DECLARE @p0 Int = 20
DECLARE @p1 Int = 10
-- EndRegion
SELECT [t1].[CustomerID], [t1].[CompanyName], [t1].[ContactName], [t1].[ContactTitle], [t1].[Address], [t1].[City], [t1].[Region], [t1].[PostalCode], [t1].[Country], [t1].[Phone], [t1].[Fax]
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY [t0].[CustomerID], [t0].[CompanyName], [t0].[ContactName], [t0].[ContactTitle], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[Phone], [t0].[Fax]) AS [ROW_NUMBER], [t0].[CustomerID], [t0].[CompanyName], [t0].[ContactName], [t0].[ContactTitle], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[Phone], [t0].[Fax]
    FROM [Customers] AS [t0]
    ) AS [t1]
WHERE [t1].[ROW_NUMBER] BETWEEN @p0 + 1 AND @p0 + @p1
ORDER BY [t1].[ROW_NUMBER]
*/