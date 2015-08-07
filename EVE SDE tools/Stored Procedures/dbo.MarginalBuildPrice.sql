
CREATE PROCEDURE [dbo].[MarginalBuildPrice]
AS
SELECT 
	ci.typeName COLLATE Latin1_General_CI_AI + ' using ' + d.typeName COLLATE Latin1_General_CI_AI AS Product, 
	ci.typeID AS productID, 
	d.typeID AS decryptorID, 
	ci.quantity + d.runs AS Quantity, 
	ci.productionTime * ( ( 100 - ( 4 + d.TE ) ) / 100 ) * 0.68 AS productionTime,
	1 / ( ( ci.quantity + d.runs ) * ci.probability * d.probability * 1.2 ) AS Invent,
	2 + d.ME AS ME
INTO #Mats
FROM dbo.invBlueprintHierachy( DEFAULT ) ci
JOIN ramDecryptors d 
	ON d.raceID = ci.raceID OR d.typeID IS NULL

CREATE TABLE #MatReq
(
	productID INT NULL,
	Product NVARCHAR(200) NULL,
	typeID INT NULL,
	Quantity INT NULL,
	productionTime INT NULL,
	baseManufacture INT NULL,
	baseInvent INT NULL
)

INSERT INTO #MatReq
SELECT 
	productID,
	Product, 
	pr.typeID, 
	pr.Quantity / #Mats.Quantity AS Quantity,
	productionTime,
	1 AS baseManufacture,
	0.02 AS baseInvent
FROM #Mats
CROSS APPLY dbo.ramInventoryRequirements( productID, #Mats.Quantity, ME ) pr

INSERT INTO #MatReq
SELECT 
	mr.typeID,
	dbo.ItemName(mr.typeID) AS Product, 
	pr.typeID, 
	pr.Quantity / mr.Quantity AS Quantity,
	b.productionTime * 0.8 * 0.68 AS productionTime,
	1 AS baseManufacture,
	NULL
FROM ( SELECT typeID, MIN(Quantity) AS Quantity FROM #MatReq GROUP BY typeID ) mr
JOIN invBlueprintTypes b ON b.productTypeID = mr.typeID
CROSS APPLY dbo.ramInventoryRequirements( mr.typeID, mr.Quantity, 10 ) pr

INSERT INTO #MatReq
SELECT 
	b.productTypeID,
	dbo.ItemName(b.productTypeID) AS Product, 
	pr.typeID, 
	pr.Quantity AS Quantity,
	b.productionTime * 0.8 * 0.68 AS productionTime,
	1 AS baseManufacture,
	NULL
FROM invBlueprintTypes b
JOIN invTypes t ON t.typeID = b.productTypeID AND published = 1
CROSS APPLY dbo.ramInventoryRequirements( b.productTypeID, 1, 10 ) pr
WHERE b.productTypeID NOT IN ( SELECT productID FROM #MatReq )

INSERT INTO #MatReq
SELECT 
	productID,
	Product,
	c.typeID,
	c.quantity * Invent AS Quantity,
	NULL,
	NULL,
	NULL
FROM #Mats
CROSS APPLY dbo.ramDatacores(productID) c

INSERT INTO #MatReq
SELECT
	productID,
	Product,
	decryptorID AS typeID,
	Invent AS Quantity,
	NULL,
	NULL,
	NULL
FROM #Mats 

INSERT INTO #MatReq
SELECT 
	NULL,
	NULL,
	productID AS typeID,
	NULL,
	NULL,
	NULL,
	NULL
FROM #MatReq

SELECT itemId, buy, sell, volume 
INTO #Market 
FROM dbo.mapPrices() 

SELECT * INTO #Adjusted FROM dbo.invAdjustedPrices()

SELECT
	dbo.mapCostIndex( -1, 'Jita', 1 ) AS Manufacture,
	dbo.mapCostIndex( -1, 'Jita', 8 ) AS Invention
INTO #Indexes

SELECT 
	productID,
	Product, 
	SUM( Quantity * sell ) + 
	COALESCE(SUM( Quantity * baseManufacture * Manufacture * adjustedPrice ), 0 ) + 
	COALESCE(SUM( Quantity * baseInvent * Invention * adjustedPrice ), 0 ) AS [Build Price],
	MAX( productionTime ) productionTime
INTO #Costs
FROM #MatReq JOIN #Indexes ON productID IS NOT NULL
LEFT JOIN #Adjusted ON #MatReq.typeId = #Adjusted.itemId
JOIN #Market ON #MatReq.typeId = #Market.itemId
GROUP BY productID, Product

SELECT 
	Product, 
	COALESCE([valueInt], [valueFloat]) AS MetaLevel,
	CONVERT(NVARCHAR, CONVERT(MONEY, [Build Price] ), 1 ) AS [Build Price], 
	CONVERT(NVARCHAR, CONVERT(MONEY, [Sell Price] ), 1 ) AS [Sell Price], 
	CASE 
	WHEN productionDays > 0 THEN
		CONVERT(NVARCHAR, productionDays) + 'd ' + CONVERT(NVARCHAR, productionTime, 108)
	WHEN ( DATEDIFF(SECOND, 0, productionTime) / portionSize ) > 60 THEN
		CONVERT(NVARCHAR, DATEADD(SECOND, DATEDIFF(SECOND, 0, productionTime) / portionSize, 0 ), 108)
	ELSE 
		CONVERT(NVARCHAR, DATEADD(MILLISECOND, 1000 * DATEDIFF(SECOND, 0, productionTime) / portionSize, 0 ), 114)
	END AS [Build Time],
	CONVERT(NVARCHAR, CONVERT(MONEY, [Isk/Hour] ), 1 ) AS [Isk/Hour],  
	Path,
	Volume 
FROM (
	SELECT
		Product, 
		productID,
		( [Build Price] / portionSize ) AS [Build Price],
		buy AS [Sell Price],
		DATEDIFF(DAY, 0, DATEADD(SECOND, productionTime / portionSize, 0 ) ) AS productionDays,
		DATEADD(SECOND, productionTime, 0 ) AS productionTime,
		3600 * portionSize * ( buy - ( [Build Price] / portionSize ) ) / productionTime AS [Isk/Hour],
		#Market.volume / portionSize AS Volume,
		portionSize,
		ROW_NUMBER() OVER ( PARTITION BY productID ORDER BY ( buy - ( [Build Price] / portionSize ) ) / productionTime DESC ) rownum,
		marketGroupID
	FROM #Costs
	JOIN invTypes ON productID = typeID
	LEFT JOIN #Market ON productID = itemId
) a
JOIN invMarketHierachy( DEFAULT ) mh ON a.marketGroupID = mh.marketGroupID
LEFT JOIN dgmTypeAttributes ON productID = dgmTypeAttributes.typeID AND attributeID = 633
WHERE rownum = 1
ORDER BY [Path], productID, [Isk/Hour] DESC