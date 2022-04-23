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
  LastName = e.LastName.ToLower()
};

query.Dump();

/*
SELECT LOWER([t0].[LastName]) AS [LastName]
FROM [Employees] AS [t0]
*/