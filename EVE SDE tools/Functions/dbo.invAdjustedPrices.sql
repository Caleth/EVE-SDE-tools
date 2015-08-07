CREATE FUNCTION [dbo].[invAdjustedPrices]
( )
RETURNS 
     TABLE (
        [itemId]        INT            NULL,
        [adjustedPrice] MONEY          NULL,
        [averagePrice]  MONEY          NULL,
        [itemName]      NVARCHAR (100) NULL)
AS
 EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[AdjustedPrices]

