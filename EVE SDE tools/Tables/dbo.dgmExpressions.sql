﻿CREATE TABLE [dbo].[dgmExpressions] (
    [expressionID]          INT            NOT NULL,
    [operandID]             INT            NULL,
    [arg1]                  INT            NULL,
    [arg2]                  INT            NULL,
    [expressionValue]       VARCHAR (100)  NULL,
    [description]           VARCHAR (1000) NULL,
    [expressionName]        VARCHAR (500)  NULL,
    [expressionTypeID]      INT            NULL,
    [expressionGroupID]     SMALLINT       NULL,
    [expressionAttributeID] SMALLINT       NULL,
    CONSTRAINT [dgmExpressions_PK] PRIMARY KEY CLUSTERED ([expressionID] ASC)
);

