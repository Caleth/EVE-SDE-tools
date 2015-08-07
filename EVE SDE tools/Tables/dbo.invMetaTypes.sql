CREATE TABLE [dbo].[invMetaTypes] (
    [typeID]       INT      NOT NULL,
    [parentTypeID] INT      NULL,
    [metaGroupID]  SMALLINT NULL,
    CONSTRAINT [invMetaTypes_PK] PRIMARY KEY CLUSTERED ([typeID] ASC)
);

