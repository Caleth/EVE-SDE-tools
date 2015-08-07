CREATE FUNCTION [dbo].[mapCostIndex]
(@systemId INT, @systemName NVARCHAR (4000), @activityId INT)
RETURNS FLOAT (53)
AS
 EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[SystemCostIndex]

