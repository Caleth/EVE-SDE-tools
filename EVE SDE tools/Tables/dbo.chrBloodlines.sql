CREATE TABLE [dbo].[chrBloodlines] (
    [bloodlineID]            TINYINT         NOT NULL,
    [bloodlineName]          NVARCHAR (100)  NULL,
    [raceID]                 TINYINT         NULL,
    [description]            NVARCHAR (1000) NULL,
    [maleDescription]        NVARCHAR (1000) NULL,
    [femaleDescription]      NVARCHAR (1000) NULL,
    [shipTypeID]             INT             NULL,
    [corporationID]          INT             NULL,
    [perception]             TINYINT         NULL,
    [willpower]              TINYINT         NULL,
    [charisma]               TINYINT         NULL,
    [memory]                 TINYINT         NULL,
    [intelligence]           TINYINT         NULL,
    [iconID]                 INT             NULL,
    [shortDescription]       NVARCHAR (500)  NULL,
    [shortMaleDescription]   NVARCHAR (500)  NULL,
    [shortFemaleDescription] NVARCHAR (500)  NULL,
    CONSTRAINT [chrBloodlines_PK] PRIMARY KEY CLUSTERED ([bloodlineID] ASC)
);

