CREATE TABLE [dbo].[mapLandmarks] (
    [landmarkID]   SMALLINT       NOT NULL,
    [landmarkName] VARCHAR (100)  NULL,
    [description]  VARCHAR (7000) NULL,
    [locationID]   INT            NULL,
    [x]            FLOAT (53)     NULL,
    [y]            FLOAT (53)     NULL,
    [z]            FLOAT (53)     NULL,
    [radius]       FLOAT (53)     NULL,
    [iconID]       INT            NULL,
    [importance]   TINYINT        NULL,
    CONSTRAINT [mapLandmarks_PK] PRIMARY KEY CLUSTERED ([landmarkID] ASC)
);

