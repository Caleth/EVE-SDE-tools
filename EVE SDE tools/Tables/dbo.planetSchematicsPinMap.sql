CREATE TABLE [dbo].[planetSchematicsPinMap] (
    [schematicID] SMALLINT NOT NULL,
    [pinTypeID]   INT      NOT NULL,
    CONSTRAINT [planetSchematicsPinMap_PK] PRIMARY KEY CLUSTERED ([schematicID] ASC, [pinTypeID] ASC)
);

