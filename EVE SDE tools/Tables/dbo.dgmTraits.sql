CREATE TABLE [dbo].[dgmTraits] (
    [traitID]   INT            NOT NULL,
    [bonusText] NVARCHAR (500) NOT NULL,
    [unitID]    TINYINT        NULL,
    CONSTRAINT [dgmTraits_PK] PRIMARY KEY CLUSTERED ([traitID] ASC)
);

