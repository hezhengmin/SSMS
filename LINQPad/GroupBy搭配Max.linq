<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = from o in Orders 
			group o by o.ShipPostalCode into g
			select new{
			    ShipPostalCode = g.Key,
				Count = g.Count(),
				Max_Freight = g.Max(m => m.Freight)
			};
			
			query.Dump();