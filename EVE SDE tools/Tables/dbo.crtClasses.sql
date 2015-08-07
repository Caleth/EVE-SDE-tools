CREATE TABLE [dbo].[crtClasses] (
    [classID]     INT            NOT NULL,
    [description] NVARCHAR (500) NULL,
    [className]   NVARCHAR (256) NULL,
    CONSTRAINT [crtClasses_PK] PRIMARY KEY CLUSTERED ([classID] ASC)
);

