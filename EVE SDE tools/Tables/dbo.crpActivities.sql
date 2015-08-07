CREATE TABLE [dbo].[crpActivities] (
    [activityID]   TINYINT         NOT NULL,
    [activityName] NVARCHAR (100)  NULL,
    [description]  NVARCHAR (1000) NULL,
    CONSTRAINT [crpActivities_PK] PRIMARY KEY CLUSTERED ([activityID] ASC)
);

