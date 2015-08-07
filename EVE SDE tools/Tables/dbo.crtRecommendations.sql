CREATE TABLE [dbo].[crtRecommendations] (
    [recommendationID]    INT     IDENTITY (1, 1) NOT NULL,
    [shipTypeID]          INT     NULL,
    [certificateID]       INT     NULL,
    [recommendationLevel] TINYINT DEFAULT ((0)) NOT NULL,
    CONSTRAINT [crtRecommendations_PK] PRIMARY KEY CLUSTERED ([recommendationID] ASC)
);

