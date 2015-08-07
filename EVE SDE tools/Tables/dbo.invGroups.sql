CREATE TABLE [dbo].[invGroups] (
    [groupID]              INT             NOT NULL,
    [categoryID]           INT             NULL,
    [groupName]            NVARCHAR (100)  COLLATE Latin1_General_CI_AI NULL,
    [description]          NVARCHAR (3000) NULL,
    [iconID]               INT             NULL,
    [useBasePrice]         BIT             NULL,
    [allowManufacture]     BIT             NULL,
    [allowRecycler]        BIT             NULL,
    [anchored]             BIT             NULL,
    [anchorable]           BIT             NULL,
    [fittableNonSingleton] BIT             NULL,
    [published]            BIT             NULL,
    CONSTRAINT [invGroups_PK] PRIMARY KEY CLUSTERED ([groupID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [invGroups_IX_category]
    ON [dbo].[invGroups]([categoryID] ASC);

