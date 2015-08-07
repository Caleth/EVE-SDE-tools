CREATE TABLE [dbo].[ramInstallationTypeContents] (
    [installationTypeID] INT     NOT NULL,
    [assemblyLineTypeID] TINYINT NOT NULL,
    [quantity]           TINYINT NULL,
    CONSTRAINT [ramInstallationTypeContents_PK] PRIMARY KEY CLUSTERED ([installationTypeID] ASC, [assemblyLineTypeID] ASC)
);

