use Northwind
go
/*
exec sp_UpdateOrders 10248, 123
@employeeID = 123 (�S���o�ӥ~����)�A��s�|���~
*/
create proc sp_UpdateOrders
 @orderID int,
 @employeeID int
as
begin try 
    begin transaction
		update Orders set EmployeeID = 1 where OrderID = 10248 --EmployeeID��s��1
		update Orders set EmployeeID = @employeeID where OrderID = @orderID
	commit transaction
end try
begin catch
	PRINT  N'rollback ��s����'
	rollback transaction --�Ĥ@��update�|rollback�^�h�AEmployeeID = 5 (�쥻)
end catch
