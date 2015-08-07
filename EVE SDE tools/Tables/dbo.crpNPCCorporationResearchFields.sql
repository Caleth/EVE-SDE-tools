CREATE TABLE [dbo].[crpNPCCorporationResearchFields] (
    [skillID]       INT NOT NULL,
    [corporationID] INT NOT NULL,
    CONSTRAINT [crpNPCCorporationResearchFields_PK] PRIMARY KEY CLUSTERED ([skillID] ASC, [corporationID] ASC)
);

