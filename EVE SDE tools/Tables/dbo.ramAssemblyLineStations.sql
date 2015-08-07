CREATE TABLE [dbo].[ramAssemblyLineStations] (
    [stationID]          INT     NOT NULL,
    [assemblyLineTypeID] TINYINT NOT NULL,
    [quantity]           TINYINT NULL,
    [stationTypeID]      INT     NULL,
    [ownerID]            INT     NULL,
    [solarSystemID]      INT     NULL,
    [regionID]           INT     NULL,
    CONSTRAINT [ramAssemblyLineStations_PK] PRIMARY KEY CLUSTERED ([stationID] ASC, [assemblyLineTypeID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ramAssemblyLineStations_IX_owner]
    ON [dbo].[ramAssemblyLineStations]([ownerID] ASC);


GO
CREATE NONCLUSTERED INDEX [ramAssemblyLineStations_IX_region]
    ON [dbo].[ramAssemblyLineStations]([regionID] ASC);

