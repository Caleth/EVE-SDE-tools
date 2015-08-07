CREATE TABLE [dbo].[chrFactions] (
    [factionID]            INT            NOT NULL,
    [factionName]          VARCHAR (100)  NULL,
    [description]          VARCHAR (1000) NULL,
    [raceIDs]              INT            NULL,
    [solarSystemID]        INT            NULL,
    [corporationID]        INT            NULL,
    [sizeFactor]           FLOAT (53)     NULL,
    [stationCount]         SMALLINT       NULL,
    [stationSystemCount]   SMALLINT       NULL,
    [militiaCorporationID] INT            NULL,
    [iconID]               INT            NULL,
    CONSTRAINT [chrFactions_PK] PRIMARY KEY CLUSTERED ([factionID] ASC)
);

