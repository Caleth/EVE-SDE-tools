CREATE TABLE [dbo].[warCombatZoneSystems] (
    [solarSystemID] INT NOT NULL,
    [combatZoneID]  INT NULL,
    CONSTRAINT [combatZoneSystems_PK] PRIMARY KEY CLUSTERED ([solarSystemID] ASC)
);

