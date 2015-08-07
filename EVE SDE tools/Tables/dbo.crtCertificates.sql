CREATE TABLE [dbo].[crtCertificates] (
    [certificateID] INT            NOT NULL,
    [groupID]       SMALLINT       NULL,
    [classID]       INT            NULL,
    [grade]         TINYINT        NULL,
    [corpID]        INT            NULL,
    [iconID]        INT            NULL,
    [description]   NVARCHAR (500) NULL,
    CONSTRAINT [crtCertificates_PK] PRIMARY KEY CLUSTERED ([certificateID] ASC)
);

