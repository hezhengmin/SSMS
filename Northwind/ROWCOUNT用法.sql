 declare @companyName nvarchar(40) = 'Ming'
 declare @phone nvarchar(24) = '123'
 update  Shippers set Phone = @phone where CompanyName = @companyName
 select @@ROWCOUNT --18
	