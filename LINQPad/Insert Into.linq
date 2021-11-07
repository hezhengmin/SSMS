<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

Customers cust = new Customers { CustomerID= "Sam", CompanyName = "Alfreds Futterkiste" };
Customers.InsertOnSubmit (cust);
SubmitChanges();
Customers.Dump ("After inserting");

/*
-- Region Parameters
DECLARE @p0 NChar(5) = 'Sam'
DECLARE @p1 NVarChar(1000) = 'Alfreds Futterkiste'
DECLARE @p2 NVarChar(1000) = null
DECLARE @p3 NVarChar(1000) = null
DECLARE @p4 NVarChar(1000) = null
DECLARE @p5 NVarChar(1000) = null
DECLARE @p6 NVarChar(1000) = null
DECLARE @p7 NVarChar(1000) = null
DECLARE @p8 NVarChar(1000) = null
DECLARE @p9 NVarChar(1000) = null
DECLARE @p10 NVarChar(1000) = null
-- EndRegion
INSERT INTO [Customers]([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax])
VALUES (@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10)
GO

SELECT [t0].[CustomerID], [t0].[CompanyName], [t0].[ContactName], [t0].[ContactTitle], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[Phone], [t0].[Fax]
FROM [Customers] AS [t0]

*/