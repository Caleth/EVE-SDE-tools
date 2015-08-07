CREATE TABLE [dbo].[dgmTypeEffects] (
    [typeID]    INT      NOT NULL,
    [effectID]  SMALLINT NOT NULL,
    [isDefault] BIT      NULL,
    CONSTRAINT [dgmTypeEffects_PK] PRIMARY KEY CLUSTERED ([typeID] ASC, [effectID] ASC)
);

