use Northwind
go
/*
exec sp_UpdateOrders 10248, 123
@employeeID = 123 (沒有這個外來鍵)，更新會錯誤
*/
create proc sp_UpdateOrders
 @orderID int,
 @employeeID int
as
begin try 
    begin transaction
		update Orders set EmployeeID = 1 where OrderID = 10248 --EmployeeID更新為1
		update Orders set EmployeeID = @employeeID where OrderID = @orderID
	commit transaction
end try
begin catch
	PRINT  N'rollback 更新失敗'
	rollback transaction --第一個update會rollback回去，EmployeeID = 5 (原本)
end catch
