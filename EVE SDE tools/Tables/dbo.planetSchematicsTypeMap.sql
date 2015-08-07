CREATE TABLE [dbo].[planetSchematicsTypeMap] (
    [schematicID] SMALLINT NOT NULL,
    [typeID]      INT      NOT NULL,
    [quantity]    SMALLINT NULL,
    [isInput]     BIT      NULL,
    CONSTRAINT [planetSchematicsTypeMap_PK] PRIMARY KEY CLUSTERED ([schematicID] ASC, [typeID] ASC)
);

