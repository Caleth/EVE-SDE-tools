CREATE TABLE [dbo].[ramAssemblyLineTypes] (
    [assemblyLineTypeID]     TINYINT         NOT NULL,
    [assemblyLineTypeName]   NVARCHAR (100)  NULL,
    [description]            NVARCHAR (1000) NULL,
    [baseTimeMultiplier]     FLOAT (53)      NULL,
    [baseMaterialMultiplier] FLOAT (53)      NULL,
    [baseCostMultiplier]     FLOAT (53)      NULL,
    [volume]                 FLOAT (53)      NULL,
    [activityID]             TINYINT         NULL,
    [minCostPerHour]         FLOAT (53)      NULL,
    CONSTRAINT [ramAssemblyLineTypes_PK] PRIMARY KEY CLUSTERED ([assemblyLineTypeID] ASC)
);

