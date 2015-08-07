CREATE TABLE [dbo].[invCategories] (
    [categoryID]   INT             NOT NULL,
    [categoryName] NVARCHAR (100)  COLLATE Latin1_General_CI_AI NULL,
    [description]  NVARCHAR (3000) NULL,
    [iconID]       INT             NULL,
    [published]    BIT             NULL,
    CONSTRAINT [invCategories_PK] PRIMARY KEY CLUSTERED ([categoryID] ASC)
);

