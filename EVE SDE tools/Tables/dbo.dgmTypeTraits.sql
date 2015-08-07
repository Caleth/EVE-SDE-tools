CREATE TABLE [dbo].[dgmTypeTraits] (
    [typeID]       INT        NOT NULL,
    [parentTypeID] INT        NOT NULL,
    [traitID]      INT        NOT NULL,
    [bonus]        FLOAT (53) NULL,
    CONSTRAINT [dgmTypeTraits_PK] PRIMARY KEY CLUSTERED ([typeID] ASC, [parentTypeID] ASC, [traitID] ASC)
);

