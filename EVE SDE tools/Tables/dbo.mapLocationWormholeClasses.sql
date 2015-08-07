CREATE TABLE [dbo].[mapLocationWormholeClasses] (
    [locationID]      INT     NOT NULL,
    [wormholeClassID] TINYINT NULL,
    CONSTRAINT [mapLocationWormholeClasses_PK] PRIMARY KEY CLUSTERED ([locationID] ASC)
);

