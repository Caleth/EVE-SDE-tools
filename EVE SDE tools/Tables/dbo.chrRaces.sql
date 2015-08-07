CREATE TABLE [dbo].[chrRaces] (
    [raceID]           TINYINT        NOT NULL,
    [raceName]         VARCHAR (100)  NULL,
    [description]      VARCHAR (1000) NULL,
    [iconID]           INT            NULL,
    [shortDescription] VARCHAR (500)  NULL,
    CONSTRAINT [chrRaces_PK] PRIMARY KEY CLUSTERED ([raceID] ASC)
);

