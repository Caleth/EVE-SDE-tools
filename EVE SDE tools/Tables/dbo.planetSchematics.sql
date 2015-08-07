CREATE TABLE [dbo].[planetSchematics] (
    [schematicID]   SMALLINT       NOT NULL,
    [schematicName] NVARCHAR (255) NULL,
    [cycleTime]     INT            NULL,
    CONSTRAINT [planetSchematics_PK] PRIMARY KEY CLUSTERED ([schematicID] ASC)
);

