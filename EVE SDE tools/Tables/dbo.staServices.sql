CREATE TABLE [dbo].[staServices] (
    [serviceID]   INT             NOT NULL,
    [serviceName] NVARCHAR (100)  NULL,
    [description] NVARCHAR (1000) NULL,
    CONSTRAINT [staServices_PK] PRIMARY KEY CLUSTERED ([serviceID] ASC)
);

