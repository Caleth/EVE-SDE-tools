CREATE TABLE [dbo].[eveIcons] (
    [iconID]      INT            NOT NULL,
    [iconFile]    VARCHAR (500)  DEFAULT ('') NOT NULL,
    [description] NVARCHAR (MAX) DEFAULT ('') NOT NULL,
    CONSTRAINT [eveIcons_PK] PRIMARY KEY CLUSTERED ([iconID] ASC)
);

