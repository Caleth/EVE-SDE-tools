CREATE TABLE [dbo].[invTypes] (
    [typeID]              INT             NOT NULL,
    [groupID]             INT             NULL,
    [typeName]            NVARCHAR (100)  COLLATE Latin1_General_CI_AI NULL,
    [description]         NVARCHAR (3000) NULL,
    [mass]                FLOAT (53)      NULL,
    [volume]              FLOAT (53)      NULL,
    [capacity]            FLOAT (53)      NULL,
    [portionSize]         INT             NULL,
    [raceID]              TINYINT         NULL,
    [basePrice]           MONEY           NULL,
    [published]           BIT             NULL,
    [marketGroupID]       INT             NULL,
    [chanceOfDuplicating] FLOAT (53)      NULL,
    [factionID]           INT             NULL,
    [graphicID]           INT             NULL,
    [iconID]              INT             NULL,
    [radius]              FLOAT (53)      NULL,
    [soundID]             INT             NULL,
    CONSTRAINT [invTypes_PK] PRIMARY KEY CLUSTERED ([typeID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [invTypes_IX_Group]
    ON [dbo].[invTypes]([groupID] ASC);

