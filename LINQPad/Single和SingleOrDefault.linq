<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

var query = (from e in Employees
			select e).SingleOrDefault(m => m.EmployeeID == 0);
			query.Dump();
//Single SQL指令沒有select top
var query1 = (from e in Employees
			 select e).Single(m => m.EmployeeID == 1);
			 query1.Dump();
