select * from [Customer]
where dbo.FN_CheckIdentityNumber(IdentityNum) = 1

begin tran
 update [Customer]
	 set State = 1,
	 SysDate = GETDATE()
 where dbo.FN_CheckIdentityNumber(IdentityNum) = 1
rollback
--commit