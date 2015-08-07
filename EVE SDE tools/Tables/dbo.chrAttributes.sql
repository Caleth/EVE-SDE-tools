CREATE TABLE [dbo].[chrAttributes] (
    [attributeID]      TINYINT        NOT NULL,
    [attributeName]    VARCHAR (100)  NULL,
    [description]      VARCHAR (1000) NULL,
    [iconID]           INT            NULL,
    [shortDescription] NVARCHAR (500) NULL,
    [notes]            NVARCHAR (500) NULL,
    CONSTRAINT [chrAttributes_PK] PRIMARY KEY CLUSTERED ([attributeID] ASC)
);

