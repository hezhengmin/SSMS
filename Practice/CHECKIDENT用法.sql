/*
自動編號欄位從1開始
DBCC CHECKIDENT(資料表名稱, RESEED, 0)
*/
DBCC CHECKIDENT ([Categories], RESEED, 0)
