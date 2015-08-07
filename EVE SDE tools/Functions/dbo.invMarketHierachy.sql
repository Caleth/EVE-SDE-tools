CREATE FUNCTION [dbo].[invMarketHierachy] (@parentGroupID INT NULL = NULL) RETURNS TABLE AS RETURN WITH MarketHierachyInner AS
  ( SELECT marketGroupName,
           marketGroupID,
           CAST(marketGroupName AS NVARCHAR(MAX)) AS [Path],
           CAST(marketGroupID AS NVARCHAR(MAX)) AS [idPath]
   FROM invMarketGroups
   WHERE (marketGroupID = @parentGroupID)
     OR (parentGroupID IS NULL
         AND @parentGroupID IS NULL)
   UNION ALL 
   SELECT m.marketGroupName,
          m.marketGroupID,
          CAST(p.[Path] + '.' + m.marketGroupName AS NVARCHAR(MAX)),
          p.[idPath] + '.' + CAST(m.marketGroupID AS NVARCHAR(MAX)) AS [idPath]
   FROM MarketHierachyInner p
   JOIN invMarketGroups m ON p.marketGroupID = m.parentGroupID)
SELECT marketGroupName,
       marketGroupID,
       [Path],
       [idPath]
FROM MarketHierachyInner;