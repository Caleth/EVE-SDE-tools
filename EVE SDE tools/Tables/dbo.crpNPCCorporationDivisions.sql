CREATE TABLE [dbo].[crpNPCCorporationDivisions] (
    [corporationID] INT     NOT NULL,
    [divisionID]    TINYINT NOT NULL,
    [size]          TINYINT NULL,
    CONSTRAINT [crpNPCCorporationDivisions_PK] PRIMARY KEY CLUSTERED ([corporationID] ASC, [divisionID] ASC)
);

