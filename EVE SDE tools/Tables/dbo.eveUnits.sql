CREATE TABLE [dbo].[eveUnits] (
    [unitID]      TINYINT        NOT NULL,
    [unitName]    VARCHAR (100)  NULL,
    [displayName] VARCHAR (50)   NULL,
    [description] VARCHAR (1000) NULL,
    CONSTRAINT [eveUnits_PK] PRIMARY KEY CLUSTERED ([unitID] ASC)
);

