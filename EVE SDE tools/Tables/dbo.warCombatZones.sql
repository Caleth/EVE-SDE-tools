CREATE TABLE [dbo].[warCombatZones] (
    [combatZoneID]   INT            DEFAULT ((-1)) NOT NULL,
    [combatZoneName] NVARCHAR (100) NULL,
    [factionID]      INT            NULL,
    [centerSystemID] INT            NULL,
    [description]    NVARCHAR (500) NULL,
    CONSTRAINT [combatZones_PK] PRIMARY KEY CLUSTERED ([combatZoneID] ASC)
);

