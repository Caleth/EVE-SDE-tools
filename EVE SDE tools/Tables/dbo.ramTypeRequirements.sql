CREATE TABLE [dbo].[ramTypeRequirements] (
    [typeID]         INT        NOT NULL,
    [activityID]     TINYINT    NOT NULL,
    [requiredTypeID] INT        NOT NULL,
    [quantity]       INT        NULL,
    [level]          INT        NULL,
    [damagePerJob]   FLOAT (53) NULL,
    [recycle]        BIT        NULL,
    [raceID]         INT        NULL,
    [probability]    FLOAT (53) NULL,
    [consume]        BIT        NULL,
    CONSTRAINT [ramTypeRequirements_PK] PRIMARY KEY CLUSTERED ([typeID] ASC, [activityID] ASC, [requiredTypeID] ASC)
);

