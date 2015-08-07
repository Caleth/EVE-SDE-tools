CREATE TABLE [dbo].[staOperations] (
    [activityID]            TINYINT         NULL,
    [operationID]           TINYINT         NOT NULL,
    [operationName]         NVARCHAR (100)  NULL,
    [description]           NVARCHAR (1000) NULL,
    [fringe]                TINYINT         NULL,
    [corridor]              TINYINT         NULL,
    [hub]                   TINYINT         NULL,
    [border]                TINYINT         NULL,
    [ratio]                 TINYINT         NULL,
    [caldariStationTypeID]  INT             NULL,
    [minmatarStationTypeID] INT             NULL,
    [amarrStationTypeID]    INT             NULL,
    [gallenteStationTypeID] INT             NULL,
    [joveStationTypeID]     INT             NULL,
    CONSTRAINT [staOperations_PK] PRIMARY KEY CLUSTERED ([operationID] ASC)
);

