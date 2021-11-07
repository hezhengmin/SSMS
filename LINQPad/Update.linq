<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

Customers cust = Customers.Single(m=>m.CustomerID== "Sam");

if(cust!=null){
	cust.CompanyName = "Ana Trujillo Emparedados y helados";  
	SubmitChanges();
	cust.Dump ("update 單個");
}

/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = 'Sam'
-- EndRegion
SELECT [t0].[CustomerID], [t0].[CompanyName], [t0].[ContactName], [t0].[ContactTitle], [t0].[Address], [t0].[City], [t0].[Region], [t0].[PostalCode], [t0].[Country], [t0].[Phone], [t0].[Fax]
FROM [Customers] AS [t0]
WHERE [t0].[CustomerID] = @p0
GO

-- Region Parameters
DECLARE @p0 NChar(5) = 'Sam  '
DECLARE @p1 NVarChar(1000) = 'Ana Trujillo Emparedados y helados'
-- EndRegion
UPDATE [Customers]
SET [CompanyName] = @p1
WHERE [CustomerID] = @p0

*/

var productsList = Products.Where(m=>m.CategoryID ==1);

foreach(var item in productsList){
	item.UnitPrice -=10;
}

SubmitChanges();
productsList.Dump ("update 多個");


