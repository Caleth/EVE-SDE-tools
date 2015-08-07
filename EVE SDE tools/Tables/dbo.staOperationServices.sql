CREATE TABLE [dbo].[staOperationServices] (
    [operationID] TINYINT NOT NULL,
    [serviceID]   INT     NOT NULL,
    CONSTRAINT [staOperationServices_PK] PRIMARY KEY CLUSTERED ([operationID] ASC, [serviceID] ASC)
);

