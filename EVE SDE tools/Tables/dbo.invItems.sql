CREATE TABLE [dbo].[invItems] (
    [itemID]     BIGINT   NOT NULL,
    [typeID]     INT      NOT NULL,
    [ownerID]    INT      NOT NULL,
    [locationID] BIGINT   NOT NULL,
    [flagID]     SMALLINT NOT NULL,
    [quantity]   INT      NOT NULL,
    CONSTRAINT [invItems_PK] PRIMARY KEY CLUSTERED ([itemID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [items_IX_OwnerLocation]
    ON [dbo].[invItems]([ownerID] ASC, [locationID] ASC);


GO
CREATE NONCLUSTERED INDEX [items_IX_Location]
    ON [dbo].[invItems]([locationID] ASC);

