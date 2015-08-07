CREATE TABLE [dbo].[dgmAttributeCategories] (
    [categoryID]          TINYINT        NOT NULL,
    [categoryName]        NVARCHAR (50)  NULL,
    [categoryDescription] NVARCHAR (200) NULL,
    CONSTRAINT [dgmAttributeCategories_PK] PRIMARY KEY CLUSTERED ([categoryID] ASC)
);

