declare @identity nvarchar(100) = 'A123456789';
declare @guid nvarchar(100) = '081d866d-4f13-451c-9cf3-1975b51380ca';
declare @ss varbinary(100) = encryptbypassphrase(@guid, @identity)
select N'加解密測試',@identity AS 明文, @ss AS 密文, cast(decryptbypassphrase(@guid,@ss) as nvarchar(max))
