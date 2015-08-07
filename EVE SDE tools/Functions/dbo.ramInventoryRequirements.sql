
/****** Object:  UserDefinedFunction [dbo].[ProductionRequirements]    Script Date: 29/07/2014 00:45:34 ******/
CREATE FUNCTION [dbo].[ramInventoryRequirements] 
(
	@typeID int,
	@Runs int = 1,
	@ME int = 0
)
RETURNS 
@Materials TABLE 
(
	typeID INT, 
	Quantity INT
)
AS
BEGIN
	DECLARE @BPID int

	SELECT @BPID = blueprintTypeID FROM invBlueprintTypes WHERE productTypeID = @typeID
 
 	INSERT INTO @Materials( typeID, Quantity ) 
	SELECT requiredTypeID, CASE WHEN quantity > 1 THEN CEILING( CAST( @Runs AS FLOAT ) * CAST( quantity AS FLOAT ) * ( 1.0 - ( @ME / 100.0 ) ) * ( 0.98 ) ) ELSE @Runs END 
	FROM ramTypeRequirements
	WHERE typeID = @BPID AND activityID = 1 AND quantity IS NOT NULL;

	RETURN 
END