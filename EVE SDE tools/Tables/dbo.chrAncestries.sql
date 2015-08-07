CREATE TABLE [dbo].[chrAncestries] (
    [ancestryID]       TINYINT         NOT NULL,
    [ancestryName]     NVARCHAR (100)  NULL,
    [bloodlineID]      TINYINT         NULL,
    [description]      NVARCHAR (1000) NULL,
    [perception]       TINYINT         NULL,
    [willpower]        TINYINT         NULL,
    [charisma]         TINYINT         NULL,
    [memory]           TINYINT         NULL,
    [intelligence]     TINYINT         NULL,
    [iconID]           INT             NULL,
    [shortDescription] NVARCHAR (500)  NULL,
    CONSTRAINT [chrAncestries_PK] PRIMARY KEY CLUSTERED ([ancestryID] ASC)
);

