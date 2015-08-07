CREATE TABLE [dbo].[invControlTowerResources] (
    [controlTowerTypeID] INT        NOT NULL,
    [resourceTypeID]     INT        NOT NULL,
    [purpose]            TINYINT    NULL,
    [quantity]           INT        NULL,
    [minSecurityLevel]   FLOAT (53) NULL,
    [factionID]          INT        NULL,
    CONSTRAINT [invControlTowerResources_PK] PRIMARY KEY CLUSTERED ([controlTowerTypeID] ASC, [resourceTypeID] ASC)
);

