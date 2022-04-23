<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
  </Connection>
</Query>

var query = Employees
.SelectMany(
e=>e.Orders,
(e, o) => 
         new  
         {
            EmployeeID = e.EmployeeID, 
            OrderID = o.OrderID, 
            OrderDate = o.OrderDate
         }
)
.OrderBy(e => e.EmployeeID);
/*
SELECT [t0].[EmployeeID], [t1].[OrderID], [t1].[OrderDate]
FROM [Employees] AS [t0], [Orders] AS [t1]
WHERE [t1].[EmployeeID] = [t0].[EmployeeID]
ORDER BY [t0].[EmployeeID]
*/

query.Dump();