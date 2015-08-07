CREATE TABLE [dbo].[crpNPCDivisions] (
    [divisionID]   TINYINT         NOT NULL,
    [divisionName] NVARCHAR (100)  NULL,
    [description]  NVARCHAR (1000) NULL,
    [leaderType]   NVARCHAR (100)  NULL,
    CONSTRAINT [crpNPCDivisions_PK] PRIMARY KEY CLUSTERED ([divisionID] ASC)
);

