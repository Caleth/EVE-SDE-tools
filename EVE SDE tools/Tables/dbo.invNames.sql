CREATE TABLE [dbo].[invNames] (
    [itemID]   BIGINT         NOT NULL,
    [itemName] NVARCHAR (200) NOT NULL,
    CONSTRAINT [invNames_PK] PRIMARY KEY CLUSTERED ([itemID] ASC)
);

