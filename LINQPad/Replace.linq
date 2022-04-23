<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
  </Connection>
</Query>

var query = from e in Employees
select new
{
  LastName = e.LastName.Replace("a","").Replace("e","")
  .Replace("i","").Replace("o","").Replace("u","")
};

query.Dump();


/*
-- Region Parameters
DECLARE @p0 NVarChar(1000) = 'a'
DECLARE @p1 NVarChar(1000) = ''
DECLARE @p2 NVarChar(1000) = 'e'
DECLARE @p3 NVarChar(1000) = ''
DECLARE @p4 NVarChar(1000) = 'i'
DECLARE @p5 NVarChar(1000) = ''
DECLARE @p6 NVarChar(1000) = 'o'
DECLARE @p7 NVarChar(1000) = ''
DECLARE @p8 NVarChar(1000) = 'u'
DECLARE @p9 NVarChar(1000) = ''
-- EndRegion
SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([t0].[LastName], @p0, @p1), @p2, @p3), @p4, @p5), @p6, @p7), @p8, @p9) AS [LastName]
FROM [Employees] AS [t0]
*/