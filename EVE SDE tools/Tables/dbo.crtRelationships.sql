CREATE TABLE [dbo].[crtRelationships] (
    [relationshipID] INT     IDENTITY (1, 1) NOT NULL,
    [parentID]       INT     NULL,
    [parentTypeID]   INT     NULL,
    [parentLevel]    TINYINT NULL,
    [childID]        INT     NULL,
    [grade]          TINYINT NULL,
    CONSTRAINT [crtRelationships_relationship] PRIMARY KEY CLUSTERED ([relationshipID] ASC)
);

