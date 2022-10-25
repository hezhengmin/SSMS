/*
資料庫中查詢 sys.database_files 目錄檢視。
壓縮ldf，先確認 name = Library_log
*/
select * from sys.database_files

USE Library;
GO
DBCC SHRINKFILE (Library_log, 2);/*壓縮成 2 MB*/
GO


/*
第二種，先切簡單，再設定為完整
*/
USE Library;
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE Library
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE (Library_Log, 1);
GO
-- Reset the database recovery model.
ALTER DATABASE Library
SET RECOVERY FULL;
GO