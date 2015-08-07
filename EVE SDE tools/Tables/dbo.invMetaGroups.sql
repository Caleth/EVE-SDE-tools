CREATE TABLE [dbo].[invMetaGroups] (
    [metaGroupID]   SMALLINT        NOT NULL,
    [metaGroupName] NVARCHAR (100)  NULL,
    [description]   NVARCHAR (1000) NULL,
    [iconID]        INT             NULL,
    CONSTRAINT [invMetaGroups_PK] PRIMARY KEY CLUSTERED ([metaGroupID] ASC)
);

