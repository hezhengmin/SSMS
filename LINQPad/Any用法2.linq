<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var temp = Products.Any(o => o.UnitPrice >= 10).Dump();

/*
-- Region Parameters
DECLARE @p0 Decimal(6,4) = 10
-- EndRegion
SELECT 
    (CASE 
        WHEN EXISTS(
            SELECT NULL AS [EMPTY]
            FROM [Products] AS [t0]
            WHERE [t0].[UnitPrice] >= @p0
            ) THEN 1
        ELSE 0
     END) AS [value]

*/