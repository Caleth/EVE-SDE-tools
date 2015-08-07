CREATE TABLE [dbo].[mapCelestialStatistics] (
    [celestialID]    INT          NOT NULL,
    [temperature]    FLOAT (53)   NULL,
    [spectralClass]  VARCHAR (10) NULL,
    [luminosity]     FLOAT (53)   NULL,
    [age]            FLOAT (53)   NULL,
    [life]           FLOAT (53)   NULL,
    [orbitRadius]    FLOAT (53)   NULL,
    [eccentricity]   FLOAT (53)   NULL,
    [massDust]       FLOAT (53)   NULL,
    [massGas]        FLOAT (53)   NULL,
    [fragmented]     BIT          NULL,
    [density]        FLOAT (53)   NULL,
    [surfaceGravity] FLOAT (53)   NULL,
    [escapeVelocity] FLOAT (53)   NULL,
    [orbitPeriod]    FLOAT (53)   NULL,
    [rotationRate]   FLOAT (53)   NULL,
    [locked]         BIT          NULL,
    [pressure]       FLOAT (53)   NULL,
    [radius]         FLOAT (53)   NULL,
    [mass]           FLOAT (53)   NULL,
    CONSTRAINT [mapCelestialStatistics_PK] PRIMARY KEY CLUSTERED ([celestialID] ASC)
);

