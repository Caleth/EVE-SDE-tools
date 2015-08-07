CREATE TABLE [dbo].[mapRegionJumps] (
    [fromRegionID] INT NOT NULL,
    [toRegionID]   INT NOT NULL,
    CONSTRAINT [mapRegionJumps_PK] PRIMARY KEY CLUSTERED ([fromRegionID] ASC, [toRegionID] ASC)
);

