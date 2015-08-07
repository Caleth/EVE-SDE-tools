CREATE TABLE [dbo].[invFlags] (
    [flagID]   SMALLINT      NOT NULL,
    [flagName] VARCHAR (200) NULL,
    [flagText] VARCHAR (100) NULL,
    [orderID]  INT           NULL,
    CONSTRAINT [invFlags_PK] PRIMARY KEY CLUSTERED ([flagID] ASC)
);

