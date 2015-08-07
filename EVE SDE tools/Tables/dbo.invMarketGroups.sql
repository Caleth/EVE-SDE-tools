CREATE TABLE [dbo].[invMarketGroups] (
    [marketGroupID]   INT             NOT NULL,
    [parentGroupID]   INT             NULL,
    [marketGroupName] NVARCHAR (100)  NULL,
    [description]     NVARCHAR (3000) NULL,
    [iconID]          INT             NULL,
    [hasTypes]        BIT             NULL,
    CONSTRAINT [invMarketGroups_PK] PRIMARY KEY CLUSTERED ([marketGroupID] ASC)
);

