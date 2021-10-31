<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = from e in Employees
			where e.Region == "WA"
			select new{ID = e.EmployeeID, Region = e.Region};

query.Dump();