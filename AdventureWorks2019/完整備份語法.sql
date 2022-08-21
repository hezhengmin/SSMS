BACKUP DATABASE [Library] TO  
DISK = N'D:\個人\DB\202208211132Library.bak' --儲存檔案的位置
WITH NOFORMAT, --完整備份
NOINIT, --附加媒體 
NAME = N'Library-完整 資料庫 備份', 
SKIP, --不須要檢查
NOREWIND, --不釋放和倒轉磁帶
NOUNLOAD, --磁帶機上保持載入
STATS = 10 --完成多少百分比時，回報一則訊息，預設10%