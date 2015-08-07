CREATE TABLE [dbo].[translationTables] (
    [sourceTable]      NVARCHAR (200) NOT NULL,
    [destinationTable] NVARCHAR (200) NULL,
    [translatedKey]    NVARCHAR (200) NOT NULL,
    [tcGroupID]        INT            NULL,
    [tcID]             INT            NULL,
    CONSTRAINT [translationTables_PK] PRIMARY KEY CLUSTERED ([sourceTable] ASC, [translatedKey] ASC)
);

