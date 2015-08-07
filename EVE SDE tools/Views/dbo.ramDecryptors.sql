/****** Object:  View [dbo].[ramDecryptors]    Script Date: 29/07/2014 19:10:34 ******/
CREATE VIEW [dbo].[ramDecryptors] AS
SELECT 
	typeName, 
	typeID, 
	CASE groupID WHEN 728 THEN 4 WHEN 729 THEN 2 WHEN 730 THEN 8 WHEN 731 THEN 1 END AS raceID, 
	inventionPropabilityMultiplier AS probability, 
	inventionMEModifier AS ME, 
	inventionTEModifier AS TE, 
	inventionMaxRunModifier AS runs
FROM 
(
	SELECT i.typeName, i.typeID, i.groupID, i.marketGroupID, attributeName, valueFloat
	FROM dgmTypeAttributes t
	INNER JOIN dgmAttributeTypes a ON t.attributeID = a.attributeID
	INNER JOIN invTypes i ON t.typeID = i.typeID
	INNER JOIN invMarketGroups g ON i.marketGroupID = g.marketGroupID AND g.parentGroupID = 1873
) AS SourceTable
PIVOT
(
	MAX(valueFloat)
	FOR attributeName in (inventionPropabilityMultiplier, inventionMEModifier, inventionTEModifier, inventionMaxRunModifier)
) AS PivotTable
UNION
SELECT 
	'no decryptor' AS typeName, 
	NULL AS typeID, 
	NULL AS raceID, 
	1 AS probability, 
	0 AS ME, 
	0 AS TE, 
	0 AS runs;