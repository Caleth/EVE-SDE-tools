CREATE TABLE [dbo].[eveGraphics] (
    [graphicID]   INT            NOT NULL,
    [graphicFile] VARCHAR (500)  DEFAULT ('') NOT NULL,
    [description] NVARCHAR (MAX) DEFAULT ('') NOT NULL,
    [obsolete]    BIT            DEFAULT ((0)) NOT NULL,
    [graphicType] VARCHAR (100)  NULL,
    [collidable]  BIT            NULL,
    [directoryID] INT            NULL,
    [graphicName] NVARCHAR (64)  DEFAULT ('') NOT NULL,
    [gfxRaceID]   VARCHAR (255)  NULL,
    [colorScheme] VARCHAR (255)  NULL,
    [sofHullName] VARCHAR (64)   NULL,
    CONSTRAINT [eveGraphics_PK] PRIMARY KEY CLUSTERED ([graphicID] ASC)
);

