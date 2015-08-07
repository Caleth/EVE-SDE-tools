CREATE TABLE [dbo].[ramAssemblyLineTypeDetailPerGroup] (
    [assemblyLineTypeID] TINYINT    NOT NULL,
    [groupID]            INT        NOT NULL,
    [timeMultiplier]     FLOAT (53) NULL,
    [materialMultiplier] FLOAT (53) NULL,
    [costMultiplier]     FLOAT (53) NULL,
    CONSTRAINT [ramAssemblyLineTypeDetailPerGroup_PK] PRIMARY KEY CLUSTERED ([assemblyLineTypeID] ASC, [groupID] ASC)
);

