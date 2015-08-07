CREATE TABLE [dbo].[invTypeMaterials] (
    [typeID]         INT NOT NULL,
    [materialTypeID] INT NOT NULL,
    [quantity]       INT DEFAULT ((0)) NOT NULL,
    CONSTRAINT [invTypeMaterials_PK] PRIMARY KEY CLUSTERED ([typeID] ASC, [materialTypeID] ASC)
);

