use AdventureWorks2019
go

/*
暫存表 [@Table]
指令執行完後，自動在記憶體中刪除
*/
DECLARE @TmpTable TABLE (
	BusinessEntityID int,
	JobTitle nvarchar(50)
)

declare @BusinessEntityID int;
declare @JobTitle nvarchar(50);

declare mycursor cursor for
	select 
	BusinessEntityID, 
	JobTitle
	from [HumanResources].[Employee]
open mycursor;

fetch next from mycursor
into @BusinessEntityID,@JobTitle
WHILE @@FETCH_STATUS = 0  
begin 
	insert into @TmpTable(BusinessEntityID,JobTitle ) values (@BusinessEntityID,@JobTitle)
	fetch next from mycursor/*執行下一個資料列*/
	into @BusinessEntityID,@JobTitle
end;

close mycursor;/*關閉資料指標*/
deallocate mycursor;/*移除資料指標參考*/

select * from @TmpTable
/*
BusinessEntityID	JobTitle
1	Chief Executive Officer
2	Vice President of Engineering
3	Engineering Manager
4	Senior Tool Designer
5	Design Engineer
6	Design Engineer
7	Research and Development Manager
...
290	Sales Representative
*/