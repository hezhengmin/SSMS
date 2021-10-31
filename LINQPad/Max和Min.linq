<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = (from e in Products
			 select e).Max(m => m.UnitPrice);
query.Dump();

var query1 = (from e in Products
			 select e).Min(m => m.UnitPrice);
query1.Dump();
//SELECT MAX([t0].[UnitPrice]) AS [value]
//FROM [Products] AS [t0]
