CREATE TABLE [dbo].[staStationTypes] (
    [stationTypeID]          INT        NOT NULL,
    [dockEntryX]             FLOAT (53) NULL,
    [dockEntryY]             FLOAT (53) NULL,
    [dockEntryZ]             FLOAT (53) NULL,
    [dockOrientationX]       FLOAT (53) NULL,
    [dockOrientationY]       FLOAT (53) NULL,
    [dockOrientationZ]       FLOAT (53) NULL,
    [operationID]            TINYINT    NULL,
    [officeSlots]            TINYINT    NULL,
    [reprocessingEfficiency] FLOAT (53) NULL,
    [conquerable]            BIT        NULL,
    CONSTRAINT [stationTypes_PK] PRIMARY KEY CLUSTERED ([stationTypeID] ASC)
);

