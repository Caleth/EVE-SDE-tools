CREATE TABLE [dbo].[agtResearchAgents] (
    [agentID] INT NOT NULL,
    [typeID]  INT NOT NULL,
    CONSTRAINT [agtResearchAgents_PK] PRIMARY KEY CLUSTERED ([agentID] ASC, [typeID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [agtResearchAgents_IX_type]
    ON [dbo].[agtResearchAgents]([typeID] ASC);

