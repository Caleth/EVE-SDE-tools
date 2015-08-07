CREATE TABLE [dbo].[dgmTypeMasteries] (
    [typeID]    INT      NOT NULL,
    [masteryID] SMALLINT NOT NULL,
    CONSTRAINT [dgmTypeMasteries_PK] PRIMARY KEY CLUSTERED ([typeID] ASC, [masteryID] ASC)
);

