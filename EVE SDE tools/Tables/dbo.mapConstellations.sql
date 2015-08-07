CREATE TABLE [dbo].[mapConstellations] (
    [regionID]          INT            NULL,
    [constellationID]   INT            NOT NULL,
    [constellationName] NVARCHAR (100) NULL,
    [x]                 FLOAT (53)     NULL,
    [y]                 FLOAT (53)     NULL,
    [z]                 FLOAT (53)     NULL,
    [xMin]              FLOAT (53)     NULL,
    [xMax]              FLOAT (53)     NULL,
    [yMin]              FLOAT (53)     NULL,
    [yMax]              FLOAT (53)     NULL,
    [zMin]              FLOAT (53)     NULL,
    [zMax]              FLOAT (53)     NULL,
    [factionID]         INT            NULL,
    [radius]            FLOAT (53)     NULL,
    CONSTRAINT [mapConstellations_PK] PRIMARY KEY CLUSTERED ([constellationID] ASC)
);

