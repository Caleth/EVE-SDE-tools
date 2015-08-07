CREATE TABLE [dbo].[trnTranslations] (
    [tcID]       SMALLINT       NOT NULL,
    [keyID]      INT            NOT NULL,
    [languageID] VARCHAR (50)   NOT NULL,
    [text]       NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [trnTranslations_PK] PRIMARY KEY CLUSTERED ([tcID] ASC, [keyID] ASC, [languageID] ASC)
);

