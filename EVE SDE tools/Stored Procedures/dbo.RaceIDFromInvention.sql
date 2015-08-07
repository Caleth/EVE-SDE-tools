CREATE PROCEDURE [dbo].[RaceIDFromInvention]
AS
UPDATE invTypes
	SET raceID = CASE r1.requiredTypeID
		WHEN 25555 THEN 1
		WHEN 25553 THEN 2
		WHEN 25556 THEN 8
		WHEN 25554 THEN 4
		WHEN 26599 THEN 1
		WHEN 26597 THEN 2
		WHEN 26601 THEN 8
		WHEN 26603 THEN 4
		ELSE t.raceID
	END
--	SELECT r1.requiredTypeID, dbo.ItemName(r1.requiredTypeID), t.*
	FROM dbo.ramTypeRequirements AS r1 
	JOIN dbo.ramTypeRequirements AS r2 ON r1.typeID = r2.typeID AND r2.probability > 0 AND r1.consume = 0
	JOIN dbo.invBlueprintTypes AS b ON r2.requiredTypeID = b.blueprintTypeID
	JOIN dbo.invTypes AS t ON b.productTypeID = t.typeID AND t.raceID IS NULL