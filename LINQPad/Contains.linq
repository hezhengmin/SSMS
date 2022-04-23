<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
  </Connection>
</Query>

var q = from c in Customers
        where c.ContactName.Contains("Anders")
        select c;
q.Dump();
/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = '%Anders%'
-- EndRegion
SELECT [t0].[CustomerID], [t0].[CompanyName], [t0].[ContactName], [t0].[ContactTitle], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[Phone], [t0].[Fax]
FROM [Customers] AS [t0]
WHERE [t0].[ContactName] LIKE @p0
*/

