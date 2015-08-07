CREATE TABLE [dbo].[invPositions] (
    [itemID] BIGINT     NOT NULL,
    [x]      FLOAT (53) DEFAULT ((0.0)) NOT NULL,
    [y]      FLOAT (53) DEFAULT ((0.0)) NOT NULL,
    [z]      FLOAT (53) DEFAULT ((0.0)) NOT NULL,
    [yaw]    REAL       NULL,
    [pitch]  REAL       NULL,
    [roll]   REAL       NULL,
    CONSTRAINT [invPositions_PK] PRIMARY KEY CLUSTERED ([itemID] ASC)
);

