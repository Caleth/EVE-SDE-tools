CREATE TABLE [dbo].[staStations] (
    [stationID]                INT            NOT NULL,
    [security]                 SMALLINT       NULL,
    [dockingCostPerVolume]     FLOAT (53)     NULL,
    [maxShipVolumeDockable]    FLOAT (53)     NULL,
    [officeRentalCost]         INT            NULL,
    [operationID]              TINYINT        NULL,
    [stationTypeID]            INT            NULL,
    [corporationID]            INT            NULL,
    [solarSystemID]            INT            NULL,
    [constellationID]          INT            NULL,
    [regionID]                 INT            NULL,
    [stationName]              NVARCHAR (100) COLLATE Latin1_General_CI_AI NULL,
    [x]                        FLOAT (53)     NULL,
    [y]                        FLOAT (53)     NULL,
    [z]                        FLOAT (53)     NULL,
    [reprocessingEfficiency]   FLOAT (53)     NULL,
    [reprocessingStationsTake] FLOAT (53)     NULL,
    [reprocessingHangarFlag]   TINYINT        NULL,
    CONSTRAINT [staStations_PK] PRIMARY KEY CLUSTERED ([stationID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_corporation]
    ON [dbo].[staStations]([corporationID] ASC);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_type]
    ON [dbo].[staStations]([stationTypeID] ASC);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_operation]
    ON [dbo].[staStations]([operationID] ASC);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_constellation]
    ON [dbo].[staStations]([constellationID] ASC);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_system]
    ON [dbo].[staStations]([solarSystemID] ASC);


GO
CREATE NONCLUSTERED INDEX [staStations_IX_region]
    ON [dbo].[staStations]([regionID] ASC);

