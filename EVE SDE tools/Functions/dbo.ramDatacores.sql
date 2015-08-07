
CREATE FUNCTION [dbo].[ramDatacores]
(
	@productID INT
)
RETURNS TABLE
AS
RETURN
SELECT rtr.requiredTypeID AS typeID, rtr.quantity
FROM ramTypeRequirements rtr 
JOIN ramTypeRequirements btr 
	ON rtr.typeID = btr.typeID
	AND rtr.quantity IS NOT NULL
	AND rtr.probability IS NULL
	AND rtr.consume IS NULL
JOIN invBlueprintTypes ibt 
    ON btr.requiredTypeID = ibt.blueprintTypeID 
    AND productTypeID = @productID 
    AND rtr.activityID = 8