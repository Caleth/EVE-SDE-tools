CREATE TABLE [dbo].[dgmMasteries] (
    [masteryID]     INT     NOT NULL,
    [certificateID] INT     NOT NULL,
    [grade]         TINYINT NOT NULL,
    CONSTRAINT [dgmMasteries_PK] PRIMARY KEY CLUSTERED ([masteryID] ASC)
);

