use Northwind
go

declare @pageIndex int = 2; --目前第幾頁面
declare @pageSize int = 10; --每頁幾筆

select * from Products 
order by ProductID asc
offset (@pageIndex-1)*@pageSize rows
fetch next @pageSize rows only

