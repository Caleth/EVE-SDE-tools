CREATE TABLE [dbo].[mapDenormalize] (
    [itemID]          INT            NOT NULL,
    [typeID]          INT            NULL,
    [groupID]         INT            NULL,
    [solarSystemID]   INT            NULL,
    [constellationID] INT            NULL,
    [regionID]        INT            NULL,
    [orbitID]         INT            NULL,
    [x]               FLOAT (53)     NULL,
    [y]               FLOAT (53)     NULL,
    [z]               FLOAT (53)     NULL,
    [radius]          FLOAT (53)     NULL,
    [itemName]        NVARCHAR (100) NULL,
    [security]        FLOAT (53)     NULL,
    [celestialIndex]  TINYINT        NULL,
    [orbitIndex]      TINYINT        NULL,
    CONSTRAINT [mapDenormalize_PK] PRIMARY KEY CLUSTERED ([itemID] ASC)
);

