CREATE TABLE [dbo].[crpNPCCorporationTrades] (
    [corporationID] INT NOT NULL,
    [typeID]        INT NOT NULL,
    CONSTRAINT [crpNPCCorporationTrades_PK] PRIMARY KEY CLUSTERED ([corporationID] ASC, [typeID] ASC)
);

