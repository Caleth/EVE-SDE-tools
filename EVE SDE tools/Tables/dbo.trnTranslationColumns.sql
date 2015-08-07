CREATE TABLE [dbo].[trnTranslationColumns] (
    [tcGroupID]  SMALLINT       NULL,
    [tcID]       SMALLINT       NOT NULL,
    [tableName]  NVARCHAR (256) NOT NULL,
    [columnName] NVARCHAR (128) NOT NULL,
    [masterID]   NVARCHAR (128) NULL,
    CONSTRAINT [translationColumns_PK] PRIMARY KEY CLUSTERED ([tcID] ASC)
);

