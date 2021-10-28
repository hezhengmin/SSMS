--查詢LogicalName 
--RESTORE FILELISTONLY
--FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\AdventureWorks2019.bak';
--go

--還原資料庫
USE [master]

RESTORE DATABASE AdventureWorks2019
FROM disk= 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\AdventureWorks2019.bak'
WITH MOVE 'AdventureWorks2017' 
TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdventureWorks2019.mdf',
MOVE 'AdventureWorks2017_log' 
TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdventureWorks2019_log.ldf'
,REPLACE