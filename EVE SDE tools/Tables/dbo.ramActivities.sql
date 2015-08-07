CREATE TABLE [dbo].[ramActivities] (
    [activityID]   TINYINT         NOT NULL,
    [activityName] NVARCHAR (100)  NULL,
    [iconNo]       VARCHAR (5)     NULL,
    [description]  NVARCHAR (1000) NULL,
    [published]    BIT             NULL,
    CONSTRAINT [ramActivities_PK] PRIMARY KEY CLUSTERED ([activityID] ASC)
);

