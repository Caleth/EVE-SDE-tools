CREATE TABLE [dbo].[invUniqueNames] (
    [itemID]   INT            NOT NULL,
    [itemName] NVARCHAR (200) COLLATE Latin1_General_CI_AI NOT NULL,
    [groupID]  INT            NULL,
    CONSTRAINT [invUniqueNames_PK] PRIMARY KEY CLUSTERED ([itemID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [invUniqueNames_IX_GroupName]
    ON [dbo].[invUniqueNames]([groupID] ASC, [itemName] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [invUniqueNames_UQ]
    ON [dbo].[invUniqueNames]([itemName] ASC);

