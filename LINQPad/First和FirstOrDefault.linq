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
			select e).First(m => m.EmployeeID == 1);
			query.Dump();			
var query1 = (from e in Employees
			 select e).FirstOrDefault(m => m.EmployeeID == 0);
			 query1.Dump();
//多個筆數，選擇第一個select top 1
var query2 = (from e in Employees
			 select e).FirstOrDefault(m => m.Region == "WA");
			 query2.Dump();
//InvalidOperationException: 序列未包含項目
var query3 = (from e in Employees
			 select e).First(m => m.Region == "W");
			 query3.Dump();