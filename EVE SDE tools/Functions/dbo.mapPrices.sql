CREATE FUNCTION [dbo].[mapPrices]
( )
RETURNS 
     TABLE (
        [itemId] INT    NULL,
        [volume] BIGINT NULL,
        [buy]    MONEY  NULL,
        [sell]   MONEY  NULL)
AS
 EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[EveCentralPrices]

