CREATE TABLE [dbo].[ramAssemblyLineTypeDetailPerCategory] (
    [assemblyLineTypeID] TINYINT    NOT NULL,
    [categoryID]         INT        NOT NULL,
    [timeMultiplier]     FLOAT (53) NULL,
    [materialMultiplier] FLOAT (53) NULL,
    [costMultiplier]     FLOAT (53) NULL,
    CONSTRAINT [ramAssemblyLineTypeDetailPerCategory_PK] PRIMARY KEY CLUSTERED ([assemblyLineTypeID] ASC, [categoryID] ASC)
);

