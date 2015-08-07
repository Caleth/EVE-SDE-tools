CREATE TABLE [dbo].[invTypeReactions] (
    [reactionTypeID] INT      NOT NULL,
    [input]          BIT      NOT NULL,
    [typeID]         INT      NOT NULL,
    [quantity]       SMALLINT NULL,
    CONSTRAINT [pk_invTypeReactions] PRIMARY KEY CLUSTERED ([reactionTypeID] ASC, [input] ASC, [typeID] ASC)
);

