SELECT DaysToManufacture, AVG(StandardCost) AS AverageCost   
FROM Production.Product  
GROUP BY DaysToManufacture;  


SELECT 
	'AverageCost' as Cost_Sorted_By_Production_Days,
	[0],[1],[2],[3],[4],[5]
FROM (
	select  DaysToManufacture, StandardCost
	FROM Production.Product  
) AS SourceTable
PIVOT  
(  
    AVG(StandardCost)
	FOR DaysToManufacture in([0],[1],[2],[3],[4],[5])

) AS PivotTable

/*
Cost_Sorted_By_Production_Days	0	1	2	3	4	5
AverageCost	5.0885	223.88	359.1082	NULL	949.4105	NULL
*/