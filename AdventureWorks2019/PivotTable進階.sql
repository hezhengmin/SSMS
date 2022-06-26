/* 
SELECT PurchaseOrderID, EmployeeID, VendorID  
FROM Purchasing.PurchaseOrderHeader
where VendorID =1566      and EmployeeID = 251 
*/

select
VendorID,[250],[251],[252],[253]
from(
SELECT PurchaseOrderID, EmployeeID, VendorID  
FROM Purchasing.PurchaseOrderHeader
) as sourceTable
PIVOT
(
	count(PurchaseOrderID)
	for EmployeeID in ([250],[251],[252],[253])
) as pivotTable

