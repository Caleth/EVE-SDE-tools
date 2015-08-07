CREATE TABLE [dbo].[agtAgents] (
    [agentID]       INT      NOT NULL,
    [divisionID]    TINYINT  NULL,
    [corporationID] INT      NULL,
    [locationID]    INT      NULL,
    [level]         TINYINT  NULL,
    [quality]       SMALLINT NULL,
    [agentTypeID]   INT      NULL,
    [isLocator]     BIT      NULL,
    CONSTRAINT [agtAgents_PK] PRIMARY KEY CLUSTERED ([agentID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [agtAgents_IX_station]
    ON [dbo].[agtAgents]([locationID] ASC);


GO
CREATE NONCLUSTERED INDEX [agtAgents_IX_corporation]
    ON [dbo].[agtAgents]([corporationID] ASC);

