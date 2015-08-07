CREATE TABLE [dbo].[trnTranslationLanguages] (
    [numericLanguageID] INT            NOT NULL,
    [languageID]        VARCHAR (50)   NULL,
    [languageName]      NVARCHAR (200) NULL,
    CONSTRAINT [trnTranslationLanguages_PK] PRIMARY KEY CLUSTERED ([numericLanguageID] ASC)
);

