<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
  </Connection>
</Query>

var q2 = from c in Customers
        select new
        {
            c.ContactName,
            SpacePos = c.ContactName.IndexOf(" ")
        };
		q2.Dump();
/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = ' '

select DATALENGTH(@p0)  --因為空白字元 2byte，然後 (2*1)/2 = 1
-- EndRegion
SELECT [t0].[ContactName], 
    (CASE 
        WHEN (DATALENGTH(@p0) / 2) = 0 THEN 0
        ELSE CHARINDEX(@p0, [t0].[ContactName]) - 1
     END) AS [SpacePos]
FROM [Customers] AS [t0]
*/